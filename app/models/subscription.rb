class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :organisation

  def expires_in_less_than_30_days
    self.expiry_date < 30.day.from_now
  end

  def is_active
    self.expiry_date > Date.yesterday # This is greater than yesterday so that expiry_date that falls on today is still counted as active
  end

  def is_expired
    self.expiry_date <= Date.yesterday # This is less and equal to yesterday so that the expiry date that falls on yesterday or older is inactive
  end

end
