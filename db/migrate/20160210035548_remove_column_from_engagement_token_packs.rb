class RemoveColumnFromEngagementTokenPacks < ActiveRecord::Migration
  def change
    remove_column :engagement_token_packs, :non_member_price, :decimal
  end
end
