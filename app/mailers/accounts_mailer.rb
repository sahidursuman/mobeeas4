class AccountsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.accounts_mailer.subscription_receipt.subject
  #
  def subscription_receipt(subscription_id, stripe_receipt_id)
  # def subscription_receipt
    @subscription = Subscription.find(subscription_id)
    @stripe_receipt_id = stripe_receipt_id
    @user = User.find(@subscription.user_id)
    if @subscription.user_type == "organisation_6_months"
      @subscription_pack = SubscriptionPack.find_by(name: "organisation_6_months")
    elsif @subscription.user_type == "organisation_12_months"
      @subscription_pack = SubscriptionPack.find_by(name: "organisation_12_months")
    elsif @subscription.user_type == "candidate_6_months"
      @subscription_pack = SubscriptionPack.find_by(name: "candidate_6_months")
    elsif @subscription.user_type == "candidate_12_months"
      @subscription_pack = SubscriptionPack.find_by(name: "candidate_12_months")
    elsif @subscription.user_type == "independent"
      @subscription_pack = SubscriptionPack.find_by(name: "independent")
    end
    mail(to: [@user.email, 'accounts@mobeeas.com'], subject: 'Receipt for your MOBEEAS subscription.')
  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.accounts_mailer.token_receipt.subject
  #
  def token_receipt(token_purchase_id, stripe_receipt_id)
    @token = TokenPurchase.find(token_purchase_id)
    @stripe_receipt_id = stripe_receipt_id

    if @token.organisation_id.present?
      @organisation = Organisation.find(@token.organisation_id)
    end
    @engagement_token_pack = EngagementTokenPack.find_by(number_of_tokens: @token.number_of_tokens)
    @user = User.find(@token.user_id)
    mail(to: [@user.email, 'accounts@mobeeas.com'], subject: 'Receipt for your MOBEEAS engagement token')
  end
end
