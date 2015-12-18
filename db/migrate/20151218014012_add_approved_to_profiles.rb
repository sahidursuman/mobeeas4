class AddApprovedToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :approved, :boolean, default: false
  end
end
