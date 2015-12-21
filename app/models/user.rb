class User < ActiveRecord::Base
	has_many :educations
	has_many :opportunities
	has_many :opportunity_applications
	has_many :org_users
	has_many :organisations, through: :org_users
	has_one :profile # this is the candidate user type
	has_one :agreement
	has_many :security_checks
	has_many :admins
	# has_many :sponsors
	has_one :sponsor # this is the sponsor user type


	has_many :candidate_skills, dependent: :destroy
	has_many :skills, through: :candidate_skills

	has_one :org_user_profile # this is the host user type
	has_many :messages

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
