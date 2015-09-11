class CreateOpportunitySkills < ActiveRecord::Migration
  def change
    create_table :opportunity_skills do |t|
      t.references :skill, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
