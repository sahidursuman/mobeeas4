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
    if @subscription.user_type == "organisation"
      @subscription_pack = SubscriptionPack.find_by(name: "organisation")
    elsif @subscription.user_type == "independent"
      @subscription_pack = SubscriptionPack.find_by(name: "independent")
    elsif @subscription.user_type == "candidate"
      @subscription_pack = SubscriptionPack.find_by(name: "candidate")
    end
    mail(to: [@user.email, 'mobeeas@mobeeas.com'], subject: 'Receipt for your MOBEEAS subscription.')
  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.accounts_mailer.token_receipt.subject
  #
  def token_receipt(token_purchase_id)
    @token = TokenPurchase.find(token_purchase_id)
    @user = User.find(@subscription.user_id)
    mail(to: @user.email, subject: 'Receipt for your MOBEEAS engagement token')
  end
end
