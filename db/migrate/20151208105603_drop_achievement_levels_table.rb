class DropAchievementLevelsTable < ActiveRecord::Migration
  def change
    drop_table :achievement_levels
  end
end
