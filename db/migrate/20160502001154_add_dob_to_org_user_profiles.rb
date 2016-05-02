class AddDobToOrgUserProfiles < ActiveRecord::Migration
  def change
    add_column :org_user_profiles, :dob, :date
  end
end
