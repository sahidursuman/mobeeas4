class AddConnectionsToOrgUserProfiles < ActiveRecord::Migration
  def change
    add_column :org_user_profiles, :connections, :integer, array: true, default: []
  end
end
