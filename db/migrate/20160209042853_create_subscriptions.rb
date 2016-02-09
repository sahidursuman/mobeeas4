class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :user_type
      t.references :user, index: true, foreign_key: true
      t.references :organisation, index: true, foreign_key: true
      t.datetime :expiry_date
      t.decimal :payment

      t.timestamps null: false
    end
  end
end
