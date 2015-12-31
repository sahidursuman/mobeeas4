class RemoveColumnsFromOpportunityTimes < ActiveRecord::Migration
  def change
    remove_column :opportunity_times, :time, :time
    remove_column :opportunity_times, :date_time, :date
  end
end
