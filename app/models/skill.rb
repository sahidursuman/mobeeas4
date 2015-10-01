class Skill < ActiveRecord::Base
  belongs_to :skill_category
  has_many :opportunity_skills
  has_many :opportunities, through: :opportunity_skills
  has_many :candidate_skills
  has_many :users, through: :candidate_skills

  def self.alphabetical
  	order(name: :asc)
  end

  def is_verified?(user_id)
    if User.find(user_id).skills
  	 CandidateSkill.find_by('user_id = ? && skill_id = ?', user_id, self.id).verified
    end
  end
end
