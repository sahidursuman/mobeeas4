class CreateTokenPurchases < ActiveRecord::Migration
  def change
    create_table :token_purchases do |t|
      t.references :user, index: true, foreign_key: true
      t.references :organisation, index: true, foreign_key: true
      t.integer :number_of_tokens
      t.decimal :token_price
      t.decimal :payment_total

      t.timestamps null: false
    end
  end
end
