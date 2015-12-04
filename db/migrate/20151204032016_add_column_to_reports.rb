class AddColumnToReports < ActiveRecord::Migration
  def change
    add_column :reports, :profile_id, :integer
  end
end
