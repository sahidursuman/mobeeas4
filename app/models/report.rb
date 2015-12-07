class Report < ActiveRecord::Base
  belongs_to :opportunity

  has_many :report_achievement_levels
  has_many :opportunities, through: :report_achievement_levels

end
