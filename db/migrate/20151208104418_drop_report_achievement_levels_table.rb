class DropReportAchievementLevelsTable < ActiveRecord::Migration
  def change
    drop_table :report_achievement_levels
  end
end
