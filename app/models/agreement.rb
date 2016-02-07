class Agreement < ActiveRecord::Base
  belongs_to :user

  # check when a host agreed on all the terms for a host
  def host_all_agreed
  	ethics == true and code_of_conduct == true and host_terms == true
  end

  # check when a candidate agreed on all the terms for a candidate
  def candidate_all_agreed
    ethics == true and code_of_conduct == true and candidate_terms == true
  end

  # check when a sponsor agreed on all the terms for a sponsor
  def sponsor_all_agreed
    ethics == true and code_of_conduct == true and sponsor_terms == true
  end

end
