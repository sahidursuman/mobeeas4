class AddSkillLevelToCandidateSkill < ActiveRecord::Migration
  def change
    add_column :candidate_skills, :skill_level, :string
  end
end
