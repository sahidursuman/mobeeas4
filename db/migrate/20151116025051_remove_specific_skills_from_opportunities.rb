class RemoveSpecificSkillsFromOpportunities < ActiveRecord::Migration
  def change
    remove_column :opportunities, :specific_skills, :text
  end
end
