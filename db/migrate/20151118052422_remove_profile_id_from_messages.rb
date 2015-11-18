class RemoveProfileIdFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :profile_id, :integer
  end
end
