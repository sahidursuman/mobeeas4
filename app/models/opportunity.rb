class Opportunity < ActiveRecord::Base
  belongs_to :organisation
  belongs_to :user

  has_many :opportunity_skills, dependent: :delete_all
  has_many :skills, through: :opportunity_skills

  has_many :opportunity_times, dependent: :delete_all

  has_many :engagements, dependent: :delete_all
  has_many :profiles, through: :engagements

  has_many :reports, dependent: :delete_all

  has_many :opportunity_school_years, dependent: :delete_all
  has_many :school_years, through: :opportunity_school_years

  has_many :expression_of_interests, dependent: :delete_all
  has_many :sponsors, through: :expression_of_interests

  scope :draft, -> { where(opportunity_status: 'draft') }
  scope :listed, -> { where(opportunity_status: 'listed') }
  scope :active, -> { where(opportunity_status: 'active') }
  scope :post_active, -> { where(opportunity_status: 'post_active') }
  scope :archived, -> { where(archived: true) }
  scope :not_archived, -> { where(archived: false) }





end
