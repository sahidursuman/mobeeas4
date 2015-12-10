class AddColumsToEngagements < ActiveRecord::Migration
  def change
    add_column :engagements, :progress_report_ids, :integer, array: true, default: []
    add_column :engagements, :completion_report_ids, :integer, array: true, default: []
  end
end
