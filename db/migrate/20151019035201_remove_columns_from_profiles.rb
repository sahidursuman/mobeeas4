class RemoveColumnsFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :message, :string
  end
end
