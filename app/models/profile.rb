class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :candidate_type

  validates :first_name, :last_name, :bio, :suburb, :postcode, :state, presence: true

  geocoded_by :profile_data
	after_validation :geocode
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
end
