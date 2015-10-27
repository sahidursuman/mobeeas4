class OrgUserProfile < ActiveRecord::Base
  belongs_to :user
  before_create :set_guid

  scope :admin_rank,->{where(admin_status: true, verified_status: true)}
  scope :user_rank,->{where(admin_status: false, verified_status: true)}

  def set_guid
    self.guid = SecureRandom.uuid
  end
end
