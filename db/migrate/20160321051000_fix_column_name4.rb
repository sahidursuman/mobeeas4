class FixColumnName4 < ActiveRecord::Migration
  def change
    rename_column :reports, :strength, :strength
  end
end
