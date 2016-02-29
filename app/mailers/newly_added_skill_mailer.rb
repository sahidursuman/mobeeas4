class NewlyAddedSkillMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newly_added_skill_mailer.approve_new_skill.subject
  #
  def approve_new_skill(skill_id, user_id)
    @skill = Skill.find(skill_id)
    @user = User.find(user_id)
    mail(to: "mobeeas@mobeeas.com", subject: 'An new skill has been created')
  end

  def notification_of_approved_new_skill(skill_id, user_id)
    @skill = Skill.find(skill_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'Your new skill in MOBEEAS has been approved')
  end
end
