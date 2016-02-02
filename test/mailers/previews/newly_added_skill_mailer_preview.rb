# Preview all emails at http://localhost:3000/rails/mailers/newly_added_skill_mailer
class NewlyAddedSkillMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/newly_added_skill_mailer/approve_new_skill
  def approve_new_skill
    NewlyAddedSkillMailer.approve_new_skill
  end

end
