class Sponsor < ActiveRecord::Base
  belongs_to :user
  mount_uploader :logo, PictureUploader
	after_create :build_agreement
  
  def name
		[first_name, last_name].compact.join(' ')
	end

  def build_agreement
		Agreement.create!(user_id: self.user.id)
	end

end
