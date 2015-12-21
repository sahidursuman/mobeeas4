class RegistrationMailer < ApplicationMailer

  def registration(resource_id)
  	@user = User.find(resource_id)
    mail(to: @user.email, subject: 'Welcome to MOBEEAS!')
  end

  def new_user_notification(resource_id)
    @user = User.find(resource_id)
    mail(to: "info@mobeeas.com", subject: 'An new user has been created')

  end

end
