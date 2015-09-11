class AddCandidateTypeToProfile < ActiveRecord::Migration
  def change
    add_reference :profiles, :candidate_type, index: true, foreign_key: true
  end
end
