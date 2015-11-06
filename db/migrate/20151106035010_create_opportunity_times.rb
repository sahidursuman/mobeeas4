class CreateOpportunityTimes < ActiveRecord::Migration
  def change
    create_table :opportunity_times do |t|
      t.time :time
      t.date :date
      t.string :day
      t.string :frequency
      t.references :opportunity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
