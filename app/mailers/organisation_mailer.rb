class OrganisationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.organisation_mailer.notify_host.subject
  #
  def notify_host(receiver_user_id, sender_user_id)
    @receiver = User.find(receiver_user_id)
    @sender = User.find(sender_user_id)
    mail(to: [@receiver.email, @sender.email], subject: 'You have been contacted by a MOBEEAS Host')
  end
end
