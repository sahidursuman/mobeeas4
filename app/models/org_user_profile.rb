class OrgUserProfile < ActiveRecord::Base
  belongs_to :user
  before_create :set_guid

  def set_guid
    self.guid = SecureRandom.uuid
  end
end
