class Organisation < ActiveRecord::Base
  belongs_to :organisation_type
  has_many :org_users
  has_many :users, through: :org_users
  has_many :subscriptions
  validates :name, :contact_name, :contact_email, :contact_phone, :address, :suburb, :state, :postcode, :country, presence: true

  mount_uploader :logo, PictureUploader

  geocoded_by :school_data
	after_validation :geocode

	def school_data
		[name, address, suburb, state, postcode, country].compact.join(', ')
	end

	def self.search(search)
	  where("name ILIKE ? OR suburb ILIKE ? OR state ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
	end

  def country_name(country_code)
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end

  def last_subscription_is_active
    self.subscriptions.last.active
  end

end
