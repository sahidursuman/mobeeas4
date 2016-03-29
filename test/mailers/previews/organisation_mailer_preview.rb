# Preview all emails at http://localhost:3000/rails/mailers/organisation_mailer
class OrganisationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/organisation_mailer/notify_admin_host
  def notify_admin_host
    OrganisationMailer.notify_admin_host
  end

  # Preview this email at http://localhost:3000/rails/mailers/organisation_mailer/notify_host
  def notify_host
    OrganisationMailer.notify_host
  end

end
