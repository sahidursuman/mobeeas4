class AddColumnsToOrgUserProfiles < ActiveRecord::Migration
  def change
    add_column :org_user_profiles, :suburb, :string
    add_column :org_user_profiles, :state, :string
    add_column :org_user_profiles, :postcode, :string
    add_column :org_user_profiles, :country, :string
  end
end
