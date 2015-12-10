class Engagement < ActiveRecord::Base
  belongs_to :opportunity
  belongs_to :profile
  has_many :reports
end
