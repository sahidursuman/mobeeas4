class AddColumnToOrgUserProfiles < ActiveRecord::Migration
  def change
    add_column :org_user_profiles, :org_creator, :boolean, default: false
  end
end
