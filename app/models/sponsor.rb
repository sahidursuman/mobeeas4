class Sponsor < ActiveRecord::Base
  belongs_to :user
  mount_uploader :logo, PictureUploader

  has_many :expression_of_interests
  has_many :opportunities, through: :expression_of_interests

  def name
		[first_name, last_name].compact.join(' ')
	end

end
