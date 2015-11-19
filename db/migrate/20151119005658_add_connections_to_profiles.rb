class AddConnectionsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :connections, :integer, array: true, default: []
  end
end
