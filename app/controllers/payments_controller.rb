class PaymentsController < ApplicationController

  def create
    # Payment is for TOKEN purchase ==================================
    if params[:token_pack].present?
      if params[:org_id].present?
        @organisation = Organisation.find(params[:org_id])
      end

      @token_pack = EngagementTokenPack.find(params[:token_pack])
      # Amount in cents
      @amount = ((@token_pack.price_ex_gst + (@token_pack.price_ex_gst * @token_pack.gst_rate)) * 100).to_i
      # Stripe expects amounts to be in cents; since the charge is for $5, the amount parameter is assigned 500.
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      if @organisation.present? # purchasing token for an ORGANISATION
        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @amount,
          :description => 'Token purchase (' + @token_pack.name + ')',
          :currency    => 'aud',
          :metadata    => {
                          'User ID'       =>  current_user.id,
                          'User Email'         =>  current_user.email,
                          'Organisation ID'  =>  @organisation.id,
                          'User Name'     =>  current_user.org_user_profile.name,
                          'Organisation'  =>  @organisation.name,
                          'Token pack' => @token_pack.name
                        }
        )
      else  # purchasing token for an INDEPENDENT HOST
        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @amount,
          :description => 'Token purchase (' + @token_pack.name + ')',
          :currency    => 'aud',
          :metadata    => {
                          'User ID'       =>  current_user.id,
                          'User Name'     =>  current_user.org_user_profile.name,
                          'User Email'         =>  current_user.email,
                          'Token pack' => @token_pack.name
                        }
        )
      end
      if charge['paid']
        # if the host is purchasing the tokens for his organisation
        if @organisation.present?
          # create token purchase
          @token_purchase = TokenPurchase.create(user_id: current_user.id, organisation_id: @organisation.id, number_of_tokens: @token_pack.number_of_tokens, payment: @token_pack.price_ex_gst)

          if @token_purchase.save
            # add number of tokens to number_of_tokens in organisation table
            @organisation.update_attributes(number_of_tokens: @organisation.number_of_tokens + @token_pack.number_of_tokens)
            @organisation.save!
            SubscriptionMailer.new_token(@token_purchase.id).deliver_now
            AccountsMailer.token_receipt(@token_purchase.id, charge['receipt_number']).deliver_now

          end
          # redirect to a thanks page
          redirect_to thanks_path(type: 'purchase')

        else # if the host is purchasing the tokens for himself (independent), which is when the org_id does not exist.
          # add number of tokens to number_of_tokens_for_independent in org_user_profiles table for this user.
          current_user.org_user_profile.update_attributes(number_of_tokens_for_independent: current_user.org_user_profile.number_of_tokens_for_independent + @token_pack.number_of_tokens)

          puts "current_user.org_user_profile.number_of_tokens_for_independent: #{current_user.org_user_profile.number_of_tokens_for_independent}"
          # create token purchase
          @token_purchase = TokenPurchase.create(user_id: current_user.id, number_of_tokens: @token_pack.number_of_tokens, payment: @token_pack.price_ex_gst)
          if @token_purchase.save
            SubscriptionMailer.new_token(@token_purchase.id).deliver_now
            AccountsMailer.token_receipt(@token_purchase.id, charge['receipt_number']).deliver_now
          end
          # redirect to a thanks page
          redirect_to thanks_path(type: 'purchase')
        end
      end


    # Payment to SUBSCRIPTION purchase for HOST that represents ORGANISATION =========================
    elsif params[:subscription_pack].present?
      @subscription_pack = SubscriptionPack.find(params[:subscription_pack])

      ### ORG HOST 6 MONTHS SUBSCRIPTION ================================
      if @subscription_pack.name == "organisation_6_months"
        @organisation = Organisation.find(params[:org_id])
        #### Find the appropriate expiry date from the last subscription by this organisation:
        if @organisation.subscriptions.present? # if this org has previous subscription
          @last_subscription = Subscription.find(@organisation.subscriptions.last.id) # get the LAST subscription of this ORGANISATION
          if @last_subscription.active # if last subscription is active, get the expiry date from this last subscription as the last expiry date.
            @last_expiry_date = @last_subscription.expiry_date
          elsif @last_subscription.expired # if the last subscription already expired, get today's date as the last expiry date.
            @last_expiry_date = Date.today
          end
        else
          @last_expiry_date = Date.today # if this org doesn't have previous subscription (brand new), get today's date as the last expiry date.
        end

        # Amount in cents
        @amount = ((@subscription_pack.price_ex_gst + (@subscription_pack.price_ex_gst * @subscription_pack.gst_rate)) * 100).to_i
        # Stripe expects amounts to be in cents; since the charge is for $5, the amount parameter is assigned 500.
        customer = Stripe::Customer.create(
          :email => params[:stripeEmail],
          :source  => params[:stripeToken],
        )

        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @amount,
          :description => 'Six Months Subscription to MOBEEAS for ' + @organisation.name,
          :currency    => 'aud',
          :metadata    => {
                          'User ID'       =>  current_user.id,
                          'Host Name'     =>  current_user.org_user_profile.name,
                          'Email'         =>  current_user.email,
                          'Organisation'  =>  @organisation.name,
                          'Subscription Type' => @subscription_pack.name,
                          'expiry_date'   =>  (@last_expiry_date + 1.year).strftime('%e %B %Y')
                        }
        )
        if charge['paid']
          # if the host is purchasing the tokens for his organisation
          if params[:org_id].present?
            # create new subscription
            @subscription = Subscription.create!(user_type: @subscription_pack.name, user_id: current_user.id, organisation_id: @organisation.id, expiry_date: (@last_expiry_date + 6.months), payment: @subscription_pack.price_ex_gst)

            if @subscription.save
              # send receipt by mail to host
              SubscriptionMailer.new_subscription(@subscription.id).deliver_now

              # increase 1 token to organisation when purchasing a new or renewing their 6-month subscription via STRIPE.
              @organisation.increase_one_token

              # Sending the mail of the the subscription receipt
              AccountsMailer.subscription_receipt(@subscription.id, charge['receipt_number']).deliver_now
            end

            # redirect to a thanks page
            redirect_to thanks_path(type: 'purchase')
          end
        end

      # Payment to SUBSCRIPTION purchase for INDEPENDENT HOST =========================
      elsif @subscription_pack.name == "independent"
        @org_user_profile = OrgUserProfile.find(current_user.org_user_profile.id)
        #### Find the appropriate expiry date from the last subscription by this independent host:
        if @org_user_profile.user.subscriptions.present? # if this host has previous subscription
          @last_subscription = Subscription.find(@org_user_profile.user.subscriptions.last.id) # get the LAST subscription of this independent host.
          if @last_subscription.active # if last subscription is active, get the expiry date from this last subscription as the last expiry date.
            @last_expiry_date = @last_subscription.expiry_date
          elsif @last_subscription.expired # if the last subscription already expired, get today's date as the last expiry date.
            @last_expiry_date = Date.today
          end
        else
          @last_expiry_date = Date.today # if this host doesn't have previous subscription (brand new), get today's date as the last expiry date.
        end

        # Amount in cents
        @amount = ((@subscription_pack.price_ex_gst + (@subscription_pack.price_ex_gst * @subscription_pack.gst_rate)) * 100).to_i
        # Stripe expects amounts to be in cents; since the charge is for $5, the amount parameter is assigned 500.
        customer = Stripe::Customer.create(
          :email => params[:stripeEmail],
          :source  => params[:stripeToken]
        )

        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @amount,
          :description => 'One Year Subscription to MOBEEAS for ' + @org_user_profile.name,
          :currency    => 'aud',
          :metadata    => {
                          'User ID'       =>  current_user.id,
                          'Host Name'     =>  current_user.org_user_profile.name,
                          'Email'         =>  current_user.email,
                          'Subscription Type' => @subscription_pack.name,
                          'expiry_date'   =>   (@last_expiry_date + 1.year).strftime('%e %B %Y')
                        }
        )
        if charge['paid']
          # create new subscription
          @subscription = Subscription.create!(user_type: @subscription_pack.name, user_id: current_user.id, expiry_date: (@last_expiry_date + 1.year), payment: @subscription_pack.price_ex_gst)

          if @subscription.save
            # send receipt by mail to host
            SubscriptionMailer.new_subscription(@subscription.id).deliver_now

            # increase 1 token to independent host when purchasing a new or renewing their subscription via STRIPE
            @org_user_profile.increase_one_token

            # Sending the mail of the the subscription receipt
            AccountsMailer.subscription_receipt(@subscription.id, charge['receipt_number']).deliver_now
          end

          # redirect to a thanks page
          redirect_to thanks_path(type: 'purchase')
        end

      # Payment to SUBSCRIPTION purchase for CANDIDATE =========================
      elsif @subscription_pack.name == "candidate"
        @profile = Profile.find(current_user.profile.id)
        #### Find the appropriate expiry date from the last subscription by this candidate:
        if @profile.user.subscriptions.present? # if this candidate has previous subscription
          @last_subscription = Subscription.find(@profile.user.subscriptions.last.id) # get the LAST subscription of this candidate.
          if @last_subscription.active # if last subscription is active, get the expiry date from this last subscription as the last expiry date.
            @last_expiry_date = @last_subscription.expiry_date
          elsif @last_subscription.expired # if the last subscription already expired, get today's date as the last expiry date.
            @last_expiry_date = Date.today
          end
        else
          @last_expiry_date = Date.today # if this host doesn't have previous subscription (brand new), get today's date as the last expiry date.
        end

        # Amount in cents
        @amount = ((@subscription_pack.price_ex_gst + (@subscription_pack.price_ex_gst * @subscription_pack.gst_rate)) * 100).to_i
        # Stripe expects amounts to be in cents; since the charge is for $5, the amount parameter is assigned 500.
        customer = Stripe::Customer.create(
          :email => params[:stripeEmail],
          :source  => params[:stripeToken]
        )

        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @amount,
          :description => 'One Year Subscription to MOBEEAS for ' + @profile.name,
          :currency    => 'aud',
          :metadata    => {
                          'User ID'       =>  current_user.id,
                          'Host Name'     =>  current_user.profile.name,
                          'Email'         =>  current_user.email,
                          'Subscription Type' => @subscription_pack.name,
                          'expiry_date'   =>   (@last_expiry_date + 1.year).strftime('%e %B %Y')
                        }
        )
        if charge['paid']
          puts "Stripe receipt number #{charge['receipt_number']}"
          # create new subscription
          @subscription = Subscription.create!(user_type: @subscription_pack.name, user_id: current_user.id, expiry_date: (@last_expiry_date + 1.year), payment: @subscription_pack.price_ex_gst)

          if @subscription.save
            SubscriptionMailer.new_subscription(@subscription.id).deliver_now # send receipt by mail to host
            # No token purchase for Candidate

            # Sending the mail of the the subscription receipt
            AccountsMailer.subscription_receipt(@subscription.id, charge['receipt_number']).deliver_now
          end

          redirect_to thanks_path(type: 'purchase')
        end
      end
    end # end of elsif params[:subscription_pack].present
  end # end of def create

  # Some payment attempts fail for a variety of reasons, such as an invalid CVC, bad card number, or general decline.
  # Any Stripe::CardError exception will be caught and stored in the flash hash.
  rescue Stripe::CardError => e
    flash[:error] = e.message
    if params[:token_pack].present?
      if params[:org_id].present?
        # organisation id exists only if the token purchase is for an organisation, but not for independent user.
        redirect_to new_token_purchase_path(org: @organisation.id, user_id: current_user.id, token_pack: @token_pack.id)
      else
        redirect_to new_token_purchase_path(token_pack: @token_pack.id)
      end
    elsif params[:subscription_pack].present?
      @subscription_pack = SubscriptionPack.find(params[:subscription_pack])
      if @subscription_pack.name == "organisation" # Subscription for HOST that represents ORGANISATION
        redirect_to new_subscription_path(org_id: @organisation.id, user_id: current_user.id, subscription_pack: @subscription_pack.id)
      elsif @subscription_pack.name == "independent" # Subscription for INDEPENDENT HOST
        redirect_to new_subscription_path(user_id: current_user.id, subscription_pack: @subscription_pack.id)
      elsif @subscription_pack.name == "candidate" # Subscription for CANDIDATE
        redirect_to new_subscription_path(user_id: current_user.id, subscription_pack: @subscription_pack.id)
      end
    end
  end
