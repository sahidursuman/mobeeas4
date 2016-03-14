class EducationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.education_mailer.notify.subject
  #
  def notify(education_id)
    @education = Education.find(education_id)
    mail(to: 'mobeeas@mobeeas.com', subject: 'A candidate has added a new education for verification')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.education_mailer.approved_by_admin.subject
  #
  def approved_by_admin(education_id)
    @education = Education.find(education_id)
    mail(to: @education.user.email, subject: 'Your new education profile has been approved by MOBEEAS Admin')
  end
end
