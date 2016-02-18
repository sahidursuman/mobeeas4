class SubscriptionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscription_mailer.expiring_in_30_days.subject
  #
  def notify(susbscription_id)
    @subscription = Subscription.find(susbscription_id)
    @user = User.find(@subscription.user_id)
    # mail(to: @user.email, subject: 'Your MOBEEAS subscription is expiring in 30 days.' )
    mail(to: 'kfatiguso@gmail.com', subject: 'Your MOBEEAS subscription is expiring soon.' )
  end
end
