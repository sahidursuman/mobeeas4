class Report < ActiveRecord::Base
  belongs_to :opportunity

  has_many :report_achievement_levels
  has_many :achievement_levels, through: :report_achievement_levels

end
