class RemoveColumsFromEngagements < ActiveRecord::Migration
  def change
    remove_column :engagements, :progress_report_id, :integer
    remove_column :engagements, :completion_report_id, :integer
  end
end
