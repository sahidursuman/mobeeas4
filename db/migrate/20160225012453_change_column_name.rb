class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :subscription_packs, :price, :price_ex_gst
  end
end
