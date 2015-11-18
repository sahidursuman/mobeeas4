class Opportunity < ActiveRecord::Base
  belongs_to :organisation
  belongs_to :user

  has_many :school_year_opportunities #the join table
  has_many :school_years, through: :school_year_opportunities

  has_many :opportunity_skills
  has_many :skills, through: :opportunity_skills

  has_many :opportunity_times

  has_many :engagements
  has_many :profiles, through: :engagements

  has_many :messages


  validates :title, :description, :commencement_date, :completion_date, presence: true
  validates :number_of_candidates, numericality: { greater_than: 0 }, presence: true


end
