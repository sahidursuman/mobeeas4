class OpportunitySchoolYear < ActiveRecord::Base
  belongs_to :opportunity
  belongs_to :school_year

  validates :number_of_students, numericality: { greater_than_or_equal_to: 0 }
  #validates_numericality_of :number_of_students, greater_than: 0
end
