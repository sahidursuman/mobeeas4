class CreateOpportunityApplications < ActiveRecord::Migration
  def change
    create_table :opportunity_applications do |t|
      t.references :user, index: true, foreign_key: true
      t.references :opportunity, index: true, foreign_key: true
      t.string :introduction
      t.string :application_status

      t.timestamps null: false
    end
  end
end
