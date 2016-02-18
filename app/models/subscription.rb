class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :organisation

  scope :organisation, -> { where(user_type: 'organisation') }
  scope :independent, -> { where(user_type: 'independent') }
  scope :candidate, -> { where(user_type: 'candidate') }
  scope :expiring_in_less_than_30_days, -> { where('expiry_date < ?', 30.day.from_now) }
  scope :expiring_in_more_than_30_days, -> { where('expiry_date >= ?', 30.day.from_now) }
  scope :is_active, -> { where('expiry_date > ?', Date.yesterday) }
  scope :is_expired, -> { where('expiry_date <= ?', Date.yesterday) }

  def notified
    !self.notified_at.nil?
  end

  def not_notified
    self.notified_at.nil?
  end

  def is_active
    self.expiry_date > Date.yesterday # This is greater than yesterday so that expiry_date that falls on today is still counted as active
  end

  def is_expired
    self.expiry_date <= Date.yesterday # This is less and equal to yesterday so that the expiry date that falls on yesterday or older is inactive
  end

  def expires_in_less_than_30_days
    self.expiry_date < 30.day.from_now
  end



  # def self.search(search)
	#   where("name ILIKE ? OR suburb ILIKE ? OR state ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
	# end

end
