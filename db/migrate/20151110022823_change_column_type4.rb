class ChangeColumnType4 < ActiveRecord::Migration
  def change
    change_column :opportunity_times, :date_time, :date
  end
end
