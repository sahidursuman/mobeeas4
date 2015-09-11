class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.references :organisation, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :opportunity_status
      t.string :name
      t.string :tagline
      t.text :info
      t.date :planned_start_date
      t.string :duration
      t.decimal :pay
      t.date :commencement_date
      t.date :completion_date

      t.timestamps null: false
    end
  end
end
