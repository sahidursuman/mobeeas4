class FixColumnName2 < ActiveRecord::Migration
  def change
    rename_column :opportunity_times, :date, :date_time
  end
end
