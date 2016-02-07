class AddApprovedToOrgUserProfiles < ActiveRecord::Migration
  def change
    add_column :org_user_profiles, :approved, :boolean, default: false
  end
end
