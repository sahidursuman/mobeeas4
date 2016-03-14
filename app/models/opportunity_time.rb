class OpportunityTime < ActiveRecord::Base
  belongs_to :opportunity

  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_in_the_past
  validate :end_date_must_be_greater_or_equal_than_start_date
  validate :end_time_must_be_after_start_time

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if start_date.present? && start_date < Date.today
  end

  def end_date_cannot_be_in_the_past
    errors.add(:end_date, "can't be in the past") if end_date.present? && end_date < Date.today
  end

  def end_date_must_be_greater_or_equal_than_start_date
    errors.add(:end_date, "must be after the start date") if start_date.present? && end_date.present? && start_date > end_date
  end

  def end_time_must_be_after_start_time
    valid = start_time.present? && end_time.present? && (start_time < end_time)
    errors.add(:end_time, "must be after the start time") unless valid
  end

end
