class Education < ActiveRecord::Base
  belongs_to :user

  validates :institution, :course, :year_completed, :terms, presence: true
  validates :terms, :acceptance => {:accept => true}
end
