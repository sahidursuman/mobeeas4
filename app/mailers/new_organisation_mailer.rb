class NewOrganisationMailer < ApplicationMailer
  def notify(org_id)
    @organisation = Organisation.find(org_id)
    mail(to: "mobeeas@mobeeas.com", subject: 'An new organisation is listed')
  end

  def register_admin(org_id, user_id)
    @organisation = Organisation.find(org_id)
    @user = User.find(user_id)
    mail(to: @organisation.contact_email, subject: 'Your Organisation and Organisation Host listing are waiting for approval')
  end

  def notify_verified_admin_host(org_id, user_id)
    @organisation = Organisation.find(org_id)
    @user = User.find(user_id)
    @org_user_profile = OrgUserProfile.find_by(user_id: user_id)
    mail(to: @user.email, subject: 'Your Organisation Executive has approved your MOBEEAS application')
  end

end
