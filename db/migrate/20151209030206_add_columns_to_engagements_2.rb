class AddColumnsToEngagements2 < ActiveRecord::Migration
  def change
    add_column :engagements, :progress_report_id, :integer
    add_column :engagements, :completion_report_id, :integer
  end
end
