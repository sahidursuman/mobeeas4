class ChangeColumnName1 < ActiveRecord::Migration
  def change
    rename_column :engagement_token_packs, :member_price, :price_ex_gst
  end
end
