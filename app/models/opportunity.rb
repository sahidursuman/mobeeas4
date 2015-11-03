class Opportunity < ActiveRecord::Base
  belongs_to :organisation
  belongs_to :user

  has_many :school_year_opportunities #the join table
  has_many :school_years, through: :school_year_opportunities
end
