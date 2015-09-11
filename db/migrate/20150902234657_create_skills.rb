class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :skill_category, index: true, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
