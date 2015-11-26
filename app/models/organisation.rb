class Organisation < ActiveRecord::Base
  belongs_to :organisation_type
  has_many :org_users
  has_many :users, through: :org_users

  mount_uploader :logo, PictureUploader

  geocoded_by :school_data
	after_validation :geocode

  validates :contact_name, :contact_email, :contact_phone, presence: true

	def school_data
		[name, address, suburb, state, postcode, country].compact.join(', ')
	end

	def self.search(search)
	  where("name ILIKE ? OR suburb ILIKE ? OR state ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
	end
end
