class AddColumnToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :archived, :boolean, default: false
  end
end
