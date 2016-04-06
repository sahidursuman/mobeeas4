class RemoveNumberOfTokensFromOpportunities < ActiveRecord::Migration
  def change
    remove_column :opportunities, :number_of_tokens, :integer
  end
end
