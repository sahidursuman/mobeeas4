class Sponsor < ActiveRecord::Base
  belongs_to :user

  mount_uploader :logo, PictureUploader

  def name
		[first_name, last_name].compact.join(' ')
	end

end
