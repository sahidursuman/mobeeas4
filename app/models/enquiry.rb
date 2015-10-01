class Enquiry < ActiveRecord::Base
	validates :name, :email, :message, presence: true
end
