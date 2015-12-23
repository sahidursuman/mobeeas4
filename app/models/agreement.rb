class Agreement < ActiveRecord::Base
  belongs_to :user

  def host_all_agreed
  	ethics == true and code_of_conduct == true and host_terms == true
  end
end
