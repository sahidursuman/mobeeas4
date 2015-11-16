class AddNumberOfCandidatesToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :number_of_candidates, :integer, default: 0
  end
end
