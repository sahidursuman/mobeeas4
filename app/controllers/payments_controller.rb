class PaymentsController < ApplicationController

  def create
    # Payment is for token purchase ==================================
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

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Token purchase (' + @token_pack.name + ')',
        :currency    => 'aud'
      )
      if charge['paid']
        # if the host is purchasing the tokens for his organisation
        if params[:org_id].present?
          # add number of tokens to number_of_tokens in organisation table
          @organisation.update_attributes(number_of_tokens: @organisation.number_of_tokens + @token_pack.number_of_tokens)

          # create token purchase
          @token_purchase = TokenPurchase.create(user_id: current_user.id, organisation_id: @organisation.id, number_of_tokens: @token_pack.number_of_tokens, payment_total: @token_pack.price_ex_gst)

          # redirect to a thanks page
          redirect_to thanks_path(type: 'purchase')

        else # if the host is purchasing the tokens for himself (independent), when the org_id does not exist.
          # add number of tokens to number_of_tokens_for_independent in org_user_profiles table for this user.
          current_user.org_user_profile.update_attributes(number_of_tokens_for_independent: current_user.org_user_profile.number_of_tokens_for_independent + @token_pack.number_of_tokens)

          puts "current_user.org_user_profile.number_of_tokens_for_independent: #{current_user.org_user_profile.number_of_tokens_for_independent}"
          # create token purchase
          @token_purchase = TokenPurchase.create(user_id: current_user.id, number_of_tokens: @token_pack.number_of_tokens, payment_total: @token_pack.price_ex_gst)

          # redirect to a thanks page
          redirect_to thanks_path(type: 'purchase')
        end
      end


    # Payment to purchase SUBSCRIPTIONS for HOST that represents ORGANISATION =========================
    elsif params[:subscription_pack].present?
      @subscription_pack = SubscriptionPack.find(params[:subscription_pack])

      # Subscription for HOST that represents ORGANISATION ===============================
      if @subscription_pack.name == "organisation"
        @organisation = Organisation.find(params[:org_id])

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
          :description => 'One Year Subscription to MOBEEAS for ' + @organisation.name,
          :currency    => 'aud',
          :metadata    => {
                          'User ID'       =>  current_user.id,
                          'Host Name'     =>  current_user.org_user_profile.name,
                          'Email'         =>  current_user.email,
                          'Organisation'  =>  @organisation.name,
                          'Subscription Type' => @subscription_pack.name,
                          'expiry_date'   =>   1.year.from_now.getlocal.strftime('%e %B %Y')
                        }
        )
        if charge['paid']
          # if the host is purchasing the tokens for his organisation
          if params[:org_id].present?
            # create new subscription
            @subscription = Subscription.create!(user_type: @subscription_pack.name, user_id: current_user.id, organisation_id: @organisation.id, expiry_date: 1.year.from_now, payment: @subscription_pack.price_ex_gst)
            if @subscription.save
              # send receipt by mail to host
              SubscriptionMailer.new_subscription(@subscription.id).deliver_now
              # increase 1 token to organisation when purchasing a new or renewing their subscription
              @organisation.number_of_tokens += 1
              @organisation.save!
            end

            # redirect to a thanks page
            redirect_to thanks_path(type: 'purchase')
          end
        end

      # Subscription for INDEPENDENT HOST ===============================
      elsif @subscription_pack.name == "independent"
        @org_user_profile = OrgUserProfile.find(current_user.org_user_profile.id)

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
                          'expiry_date'   =>   1.year.from_now.getlocal.strftime('%e %B %Y')
                        }
        )
        if charge['paid']
          # create new subscription
          @subscription = Subscription.create!(user_type: @subscription_pack.name, user_id: current_user.id, expiry_date: 1.year.from_now, payment: @subscription_pack.price_ex_gst)
          if @subscription.save
            # send receipt by mail to host
            SubscriptionMailer.new_subscription(@subscription.id).deliver_now
            # increase 1 token to independent host when purchasing a new or renewing their subscription
            @org_user_profile.number_of_tokens_for_independent += 1
            @org_user_profile.save!
          end

          # redirect to a thanks page
          redirect_to thanks_path(type: 'purchase')
        end

      # Subscription for CANDIDATE ===============================
      elsif @subscription_pack.name == "candidate"
        @profile = Profile.find(current_user.profile.id)

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
                          'expiry_date'   =>   1.year.from_now.getlocal.strftime('%e %B %Y')
                        }
        )
        if charge['paid']
          puts "Stripe receipt number #{charge['receipt_number']}"
          # create new subscription
          @subscription = Subscription.create!(user_type: @subscription_pack.name, user_id: current_user.id, expiry_date: 1.year.from_now, payment: @subscription_pack.price_ex_gst)
          @stripe_receipt_id = charge['id']
          if @subscription.save
            SubscriptionMailer.new_subscription(@subscription.id).deliver_now # send receipt by mail to host
            # No token needed for Candidate

            AccountsMailer.subscription_receipt(@subscription.id, charge['id']).deliver_now
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
