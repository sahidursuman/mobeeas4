class NewOrgUserProfileMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.new_org_user_profile_mailer.notify.subject
  #
  def notify(org_id, user_id)
    # @greeting = "Hi"
    @organisation = Organisation.find(org_id)
    @user = User.find(user_id)
    mail(to: "mobeeas@mobeeas.com", subject: 'An new organisation host is added')
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
