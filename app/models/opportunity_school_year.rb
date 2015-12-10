class OpportunitySchoolYear < ActiveRecord::Base
  belongs_to :opportunity
  belongs_to :school_year
end
