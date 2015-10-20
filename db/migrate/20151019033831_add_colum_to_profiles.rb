class AddColumToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :message, :text
  end
end
