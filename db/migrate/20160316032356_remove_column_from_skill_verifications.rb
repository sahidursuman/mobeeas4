class RemoveColumnFromSkillVerifications < ActiveRecord::Migration
  def change
    remove_column :skill_verifications, :approve, :boolean
  end
end
