class SkillVerificationMailer < ApplicationMailer

  def verify(skill_verification_id)
    @skill_verification = SkillVerification.find(skill_verification_id)
    @user = @skill_verification.user
    @user_profile = @user.profile
    @candidate_skills = @skill_verification.candidate_skills
    mail(to: @skill_verification.referree_email, subject: 'Action required: Please verify these skills')
  end

  def approve(skill_verification_id)
    @skill_verification = SkillVerification.find(skill_verification_id)
    mail(to: 'mobeeas@mobeeas.com', subject: 'Skill Verification Submitted')
  end

end
