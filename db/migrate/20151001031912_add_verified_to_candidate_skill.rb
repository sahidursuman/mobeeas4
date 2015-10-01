class AddVerifiedToCandidateSkill < ActiveRecord::Migration
  def change
    add_column :candidate_skills, :verified, :boolean, default: false
  end
end
