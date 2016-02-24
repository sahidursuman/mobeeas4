# Preview all emails at http://localhost:3000/rails/mailers/accounts_mailer
class AccountsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/accounts_mailer/subscription_receipt
  def subscription_receipt
    AccountsMailer.subscription_receipt
  end

  # Preview this email at http://localhost:3000/rails/mailers/accounts_mailer/token_receipt
  def token_receipt
    AccountsMailer.token_receipt
  end

end
