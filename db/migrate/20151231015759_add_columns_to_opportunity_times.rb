class AddColumnsToOpportunityTimes < ActiveRecord::Migration
  def change
    add_column :opportunity_times, :start_date, :date
    add_column :opportunity_times, :end_date, :date
    add_column :opportunity_times, :start_time, :time
    add_column :opportunity_times, :end_time, :time
  end
end
