class OpportunityTime < ActiveRecord::Base
  belongs_to :opportunity

  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_in_the_past
  validate :end_date_must_be_greater_or_equal_than_start_date

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if start_date.present? && start_date < Date.today
  end

  def end_date_cannot_be_in_the_past
    errors.add(:end_date, "can't be in the past") if end_date.present? && end_date < Date.today
  end

  def end_date_must_be_greater_or_equal_than_start_date
    errors.add(:end_date, "must be after the start date") if end_date.present? && start_date.present? && end_date < start_date
  end


end
