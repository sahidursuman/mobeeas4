class ChangeColInSecurityCheck < ActiveRecord::Migration
  def change
  	remove_column :security_checks, :checked, :boolean
  	add_column :security_checks, :verified, :boolean, default: false
  end
end
