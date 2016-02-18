# Preview all emails at http://localhost:3000/rails/mailers/subscription_mailer
class SubscriptionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/subscription_mailer/expiring_in_30_days
  def expiring_in_30_days
    SubscriptionMailer.expiring_in_30_days
  end

end
