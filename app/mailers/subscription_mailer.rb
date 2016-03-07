class SubscriptionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscription_mailer.expiring_in_30_days.subject
  #
  def notify(subscription_id)
    @subscription = Subscription.find(subscription_id)
    @user = User.find(@subscription.user_id)
    mail(to: @user.email, subject: 'Your MOBEEAS subscription is expiring soon.' )
  end

  def new_subscription(subscription_id)
    @subscription = Subscription.find(subscription_id)
    @user = User.find(@subscription.user_id)
    mail(to: @user.email, subject: 'Thank you for renewing your annual MOBEEAS subscription.' )
  end

  def new_token(token_purchase_id)
    @token_purchase = TokenPurchase.find(token_purchase_id)
    if @token_purchase.organisation_id.present?
      @organisation = Organisation.find(@token_purchase.organisation_id)
    end
    @user = User.find(@token_purchase.user_id)
    mail(to: @user.email, subject: 'Thank you for purchasing MOBEEAS tokens.' )

  end

end
