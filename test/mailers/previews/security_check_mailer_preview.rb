# Preview all emails at http://localhost:3000/rails/mailers/security_check_mailer
class SecurityCheckMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/security_check_mailer/notify
  def notify
    SecurityCheckMailer.notify
  end

end
