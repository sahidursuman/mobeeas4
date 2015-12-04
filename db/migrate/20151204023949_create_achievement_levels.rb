class CreateAchievementLevels < ActiveRecord::Migration
  def change
    create_table :achievement_levels do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
