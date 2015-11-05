class AddOpportunityIdToOpportunitySkills < ActiveRecord::Migration
  def change
    add_reference :opportunity_skills, :opportunity, index: true, foreign_key: true
  end
end
