class CreateCandidateSkillVerifications < ActiveRecord::Migration
  def change
    create_table :candidate_skill_verifications do |t|
      t.references :candidate_skill, index: true, foreign_key: true
      t.references :skill_verification, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
