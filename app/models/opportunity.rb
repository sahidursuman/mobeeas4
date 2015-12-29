class Opportunity < ActiveRecord::Base
  belongs_to :organisation
  belongs_to :user

  has_many :opportunity_skills
  has_many :skills, through: :opportunity_skills

  has_many :opportunity_times

  has_many :engagements
  has_many :profiles, through: :engagements

  has_many :reports

  has_many :messages

  has_many :opportunity_school_years
  has_many :school_years, through: :opportunity_school_years

  # validates :title, :description, :commencement_date, :completion_date, presence: true
  validates :number_of_tokens, numericality: { greater_than_or_equal_to: 0 }, presence: true

  scope :draft, -> { where(opportunity_status: 'draft') }
  scope :listed, -> { where(opportunity_status: 'listed') }
  scope :active, -> { where(opportunity_status: 'active') }
  scope :post_active, -> { where(opportunity_status: 'post_active') }
  scope :archived, -> { where(archived: true) }
  scope :not_archived, -> { where(archived: false) }





end
