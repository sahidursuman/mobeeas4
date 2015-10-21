class NewOrganisationMailer < ApplicationMailer
  def notify(org_id)
    @organisation = Organisation.find(org_id)
    mail(to: "info@mobeeas.com", subject: 'An new organisation is listed')
  end
end
