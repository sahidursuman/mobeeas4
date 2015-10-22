class User < ActiveRecord::Base
	has_many :educations
	has_many :opportunities
	has_many :opportunity_applications
	has_many :org_users
	has_many :organisations, through: :org_users
	has_one :profile
	has_one :agreement
	has_many :security_checks
	has_many :candidate_skills
	has_many :skills, through: :candidate_skills
	has_one :org_user_profile

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_registration_mailer

  def send_registration_mailer
  	RegistrationMailer.registration(self.id).deliver_now
  end
end
