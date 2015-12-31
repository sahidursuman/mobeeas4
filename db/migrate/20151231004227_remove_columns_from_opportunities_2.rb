class RemoveColumnsFromOpportunities2 < ActiveRecord::Migration
  def change
    remove_column :opportunities, :commencement_date, :date
    remove_column :opportunities, :completion_date, :date
  end
end
