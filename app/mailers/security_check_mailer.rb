class SecurityCheckMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.security_check_mailer.notify.subject
  #
  def notify(security_check_id)
    @security_check = SecurityCheck.find(security_check_id)
    @greeting = "Hi"
    @user = User.find(@security_check.user_id)
    mail(to: @user.email, subject: 'Your security check has been approved by MOBEEAS Admin')
  end
end
