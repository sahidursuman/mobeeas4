class SkillVerification < ActiveRecord::Base
  belongs_to :user
  has_many :candidate_skill_verifications
  has_many :candidate_skills, through: :candidate_skill_verifications

  accepts_nested_attributes_for :candidate_skills

  validates :referree_name, :referree_email, presence: true

  before_create :set_guid

  def set_guid
  	self.guid = SecureRandom.uuid
  end
end
