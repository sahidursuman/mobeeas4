class RemoveColumnsFromOrgUserProfiles < ActiveRecord::Migration
  def change
    remove_column :org_user_profiles, :admin_status, :boolean
    remove_column :org_user_profiles, :verified_status, :boolean
  end
end
