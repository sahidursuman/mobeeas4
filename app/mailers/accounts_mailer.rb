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
    # mail(to: [@user.email, 'mobeeas@mobeeas.com'], subject: 'Receipt for your MOBEEAS subscription.')
    mail(to: ['kfatiguso@gmail.com', 'mobeeas@mobeeas.com'], subject: 'Receipt for your MOBEEAS subscription.')
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
