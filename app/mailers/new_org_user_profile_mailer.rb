class NewOrgUserProfileMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.new_org_user_profile_mailer.new_organisation_host.subject
  #
  def new_organisation_host(org_id, user_id) # to notify MOBEEAS Admin
    # @greeting = "Hi"
    @organisation = Organisation.find(org_id)
    @user = User.find(user_id)
    mail(to: "mobeeas@mobeeas.com", subject: 'An new organisation host is added')
  end

  def new_independent_host(user_id) # to notify and ask for approval from MOBEEAS Admin
    # @greeting = "Hi"
    @user = User.find(user_id)
    mail(to: "mobeeas@mobeeas.com", subject: 'An new independent host is added')
  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.new_org_user_profile_mailer.register_admin.subject
  #
  def register_admin(org_id, user_id)
    # @greeting = "Hi"
    @organisation = Organisation.find(org_id)
    @user = User.find(user_id)
    mail(to: @organisation.contact_email, subject: 'An new organisation host in MOBEEAS is added, waiting for your approval.')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.new_org_user_profile_mailer.register_user.subject
  #
  def register_user(org_id, user_id)
    # @greeting = "Hi"
    @organisation = Organisation.find(org_id)
    @user = User.find(user_id)
    mail(to: @organisation.contact_email, subject: 'An new organisation host in MOBEEAS is added, waiting for your approval.')
  end
end
