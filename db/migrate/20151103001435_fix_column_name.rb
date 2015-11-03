class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :opportunities, :name, :title
    rename_column :opportunities, :info, :description
  end
end
