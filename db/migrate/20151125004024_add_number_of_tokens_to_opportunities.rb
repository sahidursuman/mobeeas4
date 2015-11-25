class AddNumberOfTokensToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :number_of_tokens, :integer, default: 0
  end
end
