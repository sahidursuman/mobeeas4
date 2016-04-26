class FixColumnName5 < ActiveRecord::Migration
  def change
    rename_column :profiles, :website, :linkedin
  end
end
