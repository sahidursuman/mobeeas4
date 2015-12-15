class Sponsor < ActiveRecord::Base
  belongs_to :user

  mount_uploader :logo, PictureUploader


end
