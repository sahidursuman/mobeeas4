class Engagement < ActiveRecord::Base
  belongs_to :opportunity
  belongs_to :profile
end
