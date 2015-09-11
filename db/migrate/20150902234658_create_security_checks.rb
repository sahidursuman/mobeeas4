class CreateSecurityChecks < ActiveRecord::Migration
  def change
    create_table :security_checks do |t|
      t.string :name
      t.string :state
      t.string :number
      t.date :expiry_date
      t.boolean :checked
      t.integer :checked_by
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
