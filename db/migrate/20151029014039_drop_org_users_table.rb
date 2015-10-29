class DropOrgUsersTable < ActiveRecord::Migration
  def change
    drop_table :org_users
  end
end
