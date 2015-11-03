class SchoolYearOpportunity < ActiveRecord::Base
  belongs_to :school_year
  belongs_to :opportunity
end
