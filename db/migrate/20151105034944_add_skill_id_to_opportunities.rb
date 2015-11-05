class AddSkillIdToOpportunities < ActiveRecord::Migration
  def change
    add_reference :opportunities, :skill, index: true, foreign_key: true
  end
end
