class FixColumName4 < ActiveRecord::Migration
  def change
    rename_column :token_purchases, :payment_total, :payment
  end
end
