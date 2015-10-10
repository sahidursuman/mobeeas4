class CandidateSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill

  has_many :candidate_skill_verifications
  has_many :candidate_skills, through: :candidate_skill_verifications

end
