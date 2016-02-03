class AddColumnsToReports < ActiveRecord::Migration
  def change
    add_column :reports, :engagement_start_date, :datetime
    add_column :reports, :engagement_end_date, :datetime
  end
end
