class RemoveColumnsFromEngagements < ActiveRecord::Migration
  def change
    remove_column :engagements, :progress_report_id, :datetime
    remove_column :engagements, :completion_report_id, :datetime
  end
end
