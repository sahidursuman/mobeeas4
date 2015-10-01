class SkillCategory < ActiveRecord::Base
	has_many :skills

	default_scope { order name: :asc }

end
