class SchoolYear < ActiveRecord::Base
  has_many :school_year_opportunities
  has_many :opportunities, through: :school_year_opportunities
end
