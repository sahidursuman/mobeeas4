class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :candidate_type

  has_many :engagements
  has_many :opportunities, through: :engagements

  validates :first_name, :last_name, :dob, :bio, :suburb, :postcode, :state, :country, presence: true

  # KEEP THIS and use geocode later
  # geocoded_by :profile_data
	# after_validation :geocode

	after_create :build_agreement

	mount_uploader :picture, PictureUploader

	def build_agreement
		Agreement.create!(user_id: self.user.id)
	end

	def name
		[first_name, last_name].compact.join(' ')
	end

	def profile_data
		[address, suburb, state, postcode, country].compact.join(', ')
	end

  scope :not_approved, -> {where(approved: false)}
  scope :approved, -> {where(approved: true)}
  scope :paid_candidate, -> {where(unpaid_volunteer: false)}
  scope :unpaid_candidate, -> {where(unpaid_volunteer: true)}

  def country_name(country_code)
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end

end
