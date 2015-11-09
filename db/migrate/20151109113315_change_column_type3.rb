class ChangeColumnType3 < ActiveRecord::Migration
  def change
    change_column :opportunity_times, :date, :datetime
  end
end
