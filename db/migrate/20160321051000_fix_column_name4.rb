class FixColumnName4 < ActiveRecord::Migration
  def change
    rename_column :reports, :stength, :strength
  end
end
