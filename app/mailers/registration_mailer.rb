class RegistrationMailer < ApplicationMailer

  def registration(resource_id)
  	@user = User.find(resource_id)
    mail(to: "to@example.org", subject: 'Welcome to MOBEEAS!')
  end
end
