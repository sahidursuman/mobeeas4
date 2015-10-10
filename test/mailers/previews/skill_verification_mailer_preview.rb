# Preview all emails at http://localhost:3000/rails/mailers/skill_verification_mailer
class SkillVerificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/skill_verification_mailer/verify
  def verify
    SkillVerificationMailer.verify
  end

end
