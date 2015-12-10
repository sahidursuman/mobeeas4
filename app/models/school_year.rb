class SchoolYear < ActiveRecord::Base
  has_many :opportunity_school_years
  has_many :opportunities, through: :opportunity_school_years
end
