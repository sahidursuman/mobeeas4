class Agreement < ActiveRecord::Base
  belongs_to :user

  def all_agreed?
  	ethics == true and code_of_conduct == true and terms == true
  end
end
