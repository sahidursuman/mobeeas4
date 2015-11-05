class RemoveColumnFromOpportunitySkills < ActiveRecord::Migration
  def change
    remove_column :opportunity_skills, :project_id, :integer
  end
end
