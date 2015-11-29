class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :profile
  belongs_to :opportunity

  mount_uploader :attachment, PictureUploader

  scope :unread,->{ where(status: 'unread') }

  def self.count_new_messages(to_id, from_id)
    where(to: to_id, from: from_id, status: "unread").count
  end

  def status_read
    self.update_attributes(status: 'read')
    self.save!
  end

  def self.check_for_expired_listings
    newly_expired_listings.each do |listing|
      listing.update_attributes(status: 'expired')
      listing.save!
    end
  end

end
