class AddGstRateToEngagementTokenPacks < ActiveRecord::Migration
  def change
    add_column :engagement_token_packs, :gst_rate, :decimal, default: 0.1
  end
end
