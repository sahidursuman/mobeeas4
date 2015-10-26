class AddAchievementToEducations < ActiveRecord::Migration
  def change
    add_column :educations, :achievement, :string
  end
end
