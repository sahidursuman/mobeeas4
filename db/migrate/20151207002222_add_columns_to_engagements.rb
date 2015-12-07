class AddColumnsToEngagements < ActiveRecord::Migration
  def change
    add_column :engagements, :progress_report, :datetime
    add_column :engagements, :completion_report, :datetime
  end
end
