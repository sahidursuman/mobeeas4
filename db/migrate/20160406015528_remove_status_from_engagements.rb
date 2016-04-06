class RemoveStatusFromEngagements < ActiveRecord::Migration
  def change
    remove_column :engagements, :status, :string
  end
end
