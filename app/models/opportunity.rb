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
  validates :number_of_tokens, numericality: { greater_than_equal: 0 }, presence: true

  scope :draft, -> { where(opportunity_status: 'draft') }
  scope :listed, -> { where(opportunity_status: 'listed') }
  scope :active, -> { where(opportunity_status: 'active') }
  scope :completed, -> { where(opportunity_status: 'completed') }



end
