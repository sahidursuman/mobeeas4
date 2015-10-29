class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :org_users, :admin_status, :boolean, default: false
    change_column :org_users, :verified_status, :boolean, default: false    
  end
end
