class SkillCategory < ActiveRecord::Base
	has_many :skills

	def self.alphabetical
  	order(name: :asc)
  end
end
