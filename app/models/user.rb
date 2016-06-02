class User < ActiveRecord::Base
	has_many :educations
	has_many :opportunities
	has_many :opportunity_applications
	has_many :org_users # a user can be a host for several organisations
	has_many :organisations, through: :org_users
	has_one :profile # a user can create one candidate profile
	has_one :agreement
	has_many :security_checks
	has_one :admin # a user can create one admin profile
	has_one :sponsor # a user can create one sponsor profile
	has_many :subscriptions
	has_many :feedbacks


	has_many :candidate_skills, dependent: :destroy
	has_many :skills, through: :candidate_skills

	has_one :org_user_profile # this is the host user type

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	# These code block below has been moved to Controller pages for Candidate Create function and Sponsor Create
  # after_create :send_registration_mailer
	#
  # def send_registration_mailer
  # 	RegistrationMailer.registration(self.id).deliver_now
  # end

	def all_security_check_verified
    self.security_checks.each do |check|
      unless check.verified
        return false
      end
      true
    end
  end

end
