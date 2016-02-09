class CreateSubscriptionPacks < ActiveRecord::Migration
  def change
    create_table :subscription_packs do |t|
      t.string :name
      t.decimal :price

      t.timestamps null: false
    end
  end
end
