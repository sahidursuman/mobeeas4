class OrgUserProfile < ActiveRecord::Base
  belongs_to :user
  before_create :set_guid
  after_create :build_agreement
  validates :first_name, :last_name, :phone, :position, presence: true

  scope :admin_rank,->{where(admin_status: true, verified_status: true)}
  scope :user_rank,->{where(admin_status: false, verified_status: true)}

  def set_guid
    self.guid = SecureRandom.uuid
  end

  def name
		[first_name, last_name].compact.join(' ')
	end

  def build_agreement
		Agreement.create!(user_id: self.user.id)
	end


end
