class NewOrganisationMailer < ApplicationMailer
  def notify(org_id)
    @organisation = Organisation.find(org_id)
    mail(to: "info@mobeeas.com", subject: 'An new organisation is listed')
  end

  def register_admin(org_id, user_id)
    @organisation = Organisation.find(org_id)
    @user = User.find(user_id)
    mail(to: @organisation.contact_email, subject: 'Your Organisation and Organisation Host listing are waiting for approval')
  end

end
