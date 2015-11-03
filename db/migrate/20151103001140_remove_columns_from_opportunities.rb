class RemoveColumnsFromOpportunities < ActiveRecord::Migration
  def change
    remove_column :opportunities, :tagline, :string
    remove_column :opportunities, :planned_start_date, :date
    remove_column :opportunities, :duration, :string
  end
end
