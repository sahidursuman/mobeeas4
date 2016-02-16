class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :organisation

  def expires_in_30_days
    if self.expiry_date == 30.day.from_now

    end
  end

  def is_active
    self.expiry_date > Date.yesterday # This is greater than yesterday so that expiry_date that falls on today is still counted as active
  end

  def is_expired
    self.expiry_date <= Date.yesterday # This is less and equal to yesterday so that the expiry date that falls on yesterday or older is inactive
  end

  def expired_today

  end

end
