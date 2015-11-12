class CreateEngagementTokenPacks < ActiveRecord::Migration
  def change
    create_table :engagement_token_packs do |t|
      t.string :name
      t.decimal :member_price
      t.decimal :non_member_price
      t.integer :number_of_tokens

      t.timestamps null: false
    end
  end
end
