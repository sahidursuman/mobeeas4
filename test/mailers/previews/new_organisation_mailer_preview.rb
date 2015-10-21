# Preview all emails at http://localhost:3000/rails/mailers/new_organisation_mailer
class NewOrganisationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/new_organisation_mailer/notify
  def notify
    NewOrganisationMailer.notify
  end

end
