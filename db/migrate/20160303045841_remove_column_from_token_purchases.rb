class RemoveColumnFromTokenPurchases < ActiveRecord::Migration
  def change
    remove_column :token_purchases, :token_price, :decimal
  end
end
