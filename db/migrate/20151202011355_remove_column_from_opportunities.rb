class RemoveColumnFromOpportunities < ActiveRecord::Migration
  def change
    remove_column :opportunities, :number_of_candidates, :integer
  end
end
