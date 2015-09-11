class CreateCandidateSkills < ActiveRecord::Migration
  def change
  	# drop_table :student_skills
    create_table :candidate_skills do |t|
      t.references :user, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
