class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :organisation
  validates :user_id, presence: true

  scope :organisation, -> { where('user_type =? OR user_type =?', 'organisation_6_months','organisation_12_months') }
  scope :independent, -> { where(user_type: 'independent') }
  scope :candidate_paid, -> { where('user_type =? OR user_type =?', 'candidate_6_months','candidate_12_months') }
  scope :candidate_volunteer, -> { where('user_type =?', 'candidate_6_months_unpaid') }
  scope :expiring_in_less_than_30_days, -> { where('expiry_date < ?', 30.day.from_now) }
  scope :expiring_in_more_than_30_days, -> { where('expiry_date >= ?', 30.day.from_now) }
  scope :are_active, -> { where('expiry_date >= ?', Date.today) }
  scope :are_expired, -> { where('expiry_date < ?', Date.today) }

  def notified
    !self.notified_at.nil?
  end

  def not_notified
    self.notified_at.nil?
  end

  def active
    self.expiry_date >= Date.today # This is greater and equal than today so that expiry_date that falls on today is still counted as active
  end

  def expired
    self.expiry_date < Date.today # This is less to today so that the expiry date that falls on yesterday or older is inactive
  end

  def expires_in_less_than_30_days
    self.expiry_date < 30.day.from_now
  end

  def expires_in_more_than_30_days
    self.expiry_date >= 30.day.from_now
  end



  # def self.search(search)
	#   where("name ILIKE ? OR suburb ILIKE ? OR state ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
	# end

end
