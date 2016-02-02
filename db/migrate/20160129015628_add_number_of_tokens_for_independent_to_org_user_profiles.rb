class AddNumberOfTokensForIndependentToOrgUserProfiles < ActiveRecord::Migration
  def change
    add_column :org_user_profiles, :number_of_tokens_for_independent, :integer, default: 0
  end
end
