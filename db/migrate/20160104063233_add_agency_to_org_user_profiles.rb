class AddAgencyToOrgUserProfiles < ActiveRecord::Migration
  def change
    add_column :org_user_profiles, :agency, :string
  end
end
