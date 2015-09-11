class CreateSkillCategories < ActiveRecord::Migration
  def change
    create_table :skill_categories do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
