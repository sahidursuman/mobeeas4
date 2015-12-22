class Agreement < ActiveRecord::Base
  belongs_to :user
  # Not quite useful right now, commented out.
  # def all_agreed?
  # 	ethics == true and code_of_conduct == true and candidate_terms == true
  # end
end
