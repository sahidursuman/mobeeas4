class FixColumnName1 < ActiveRecord::Migration
  def change
    rename_column :school_years, :level, :name
  end
end
