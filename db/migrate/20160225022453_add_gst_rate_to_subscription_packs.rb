class AddGstRateToSubscriptionPacks < ActiveRecord::Migration
  def change
    add_column :subscription_packs, :gst_rate, :decimal, default: 0.1
  end
end
