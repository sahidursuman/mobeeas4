class Report < ActiveRecord::Base
  belongs_to :opportunity
  belongs_to :engagement

end
