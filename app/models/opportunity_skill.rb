class OpportunitySkill < ActiveRecord::Base
  belongs_to :skill
  belongs_to :project
end
