# Preview all emails at http://localhost:3000/rails/mailers/new_org_user_profile_mailer
class NewOrgUserProfileMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/new_org_user_profile_mailer/notify
  def notify
    NewOrgUserProfileMailer.notify
  end

  # Preview this email at http://localhost:3000/rails/mailers/new_org_user_profile_mailer/register_admin
  def register_admin
    NewOrgUserProfileMailer.register_admin
  end

  # Preview this email at http://localhost:3000/rails/mailers/new_org_user_profile_mailer/register_user
  def register_user
    NewOrgUserProfileMailer.register_user
  end

end
