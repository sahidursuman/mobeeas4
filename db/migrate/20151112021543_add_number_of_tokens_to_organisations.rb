class AddNumberOfTokensToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :number_of_tokens, :integer, default: 0
  end
end
