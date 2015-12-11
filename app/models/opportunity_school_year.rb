class OpportunitySchoolYear < ActiveRecord::Base
  belongs_to :opportunity
  belongs_to :school_year

  validate :number_of_students, numericality: { greater_than_equal: 0 }
end
