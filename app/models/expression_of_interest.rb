class ExpressionOfInterest < ActiveRecord::Base
  belongs_to :sponsor
  belongs_to :opportunity

  scope :approved, -> {where(approved: true)}
  scope :not_approved, -> {where(approved: false)}

end
