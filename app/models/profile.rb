class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :candidate_type

  validates :first_name, :last_name, :bio, :address, :suburb, :postcode, :state, presence: true

  geocoded_by :profile_data
	after_validation :geocode

	mount_uploader :picture, PictureUploader

	def name
		[first_name, last_name].compact.join(' ')
	end

	def profile_data
		[address, suburb, state, postcode, country].compact.join(', ')
	end
end
