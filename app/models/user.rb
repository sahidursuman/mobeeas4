class User < ActiveRecord::Base
	has_many :educations
	has_many :opportunities
	has_many :opportunity_applications
	has_one :org_user
	has_one :organisation, through: :org_user
	has_one :profile
	has_many :security_checks
	has_many :candidate_skills
	has_many :skills, through: :candidate_skills
	
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
