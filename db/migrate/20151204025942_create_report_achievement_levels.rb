class CreateReportAchievementLevels < ActiveRecord::Migration
  def change
    create_table :report_achievement_levels do |t|
      t.references :report, index: true, foreign_key: true
      t.references :achievement_level, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
