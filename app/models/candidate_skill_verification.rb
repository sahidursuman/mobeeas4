class CandidateSkillVerification < ActiveRecord::Base
  belongs_to :candidate_skill
  belongs_to :skill_verification
end
