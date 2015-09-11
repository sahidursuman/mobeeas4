class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :candidate_type

  geocoded_by :profile_data
	after_validation :geocode

	mount_uploader :picture, PictureUploader

	def profile_data
		[address, suburb, state, postcode, country].compact.join(', ')
	end
end
