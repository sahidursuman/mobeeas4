class ReportAchievementLevel < ActiveRecord::Base
  belongs_to :report
  belongs_to :achievement_level
end
