class AchievementLevel < ActiveRecord::Base
  has_many :report_achievement_levels,
  has_many :reports, through: :report_achievement_levels

end
