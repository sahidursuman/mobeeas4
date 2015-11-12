class PaymentsController < ApplicationController

  def create
  # Amount in cents
  @organisation = Organisation.find(params[:org_id])
  @token_pack = EngagementTokenPack.find(params[:token_pack])
  @amount = (@token_pack.member_price * 100).to_i

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
    # add number of tokens to number_of_tokens in organisation table
    @organisation.update_attributes(number_of_tokens: @organisation.number_of_tokens + @token_pack.number_of_tokens)
    # @organisation.number_of_tokens = @token_pack.number_of_tokens
    #@organisation.save!

    # create token purchase
    @token_purchase = TokenPurchase.create(user_id: current_user.id, organisation_id: @organisation.id, number_of_tokens: @token_pack.number_of_tokens, payment_total: @token_pack.member_price)
    # @token_purchase.user_id = current_user.id
    # @token_purchase.organisation_id = @organisation.id
    # @token_purchase.number_of_tokens = @token_pack.number_of_tokens
    # @token_purchase.payment_total = @amount
    #@token_purchase.save!

    charge['receipt_email'] = current_user.email

    # redirect to a thanks page
    redirect_to thanks3_path
  end
rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_token_purchase_path(org: @organisation.id, token_pack: @token_pack.id)
end
end
