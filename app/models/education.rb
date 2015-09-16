class Education < ActiveRecord::Base
  belongs_to :user

  validates :institution, :course, :year_completed, :terms, presence: true
  # validates :terms, :acceptance => {:accept => true}, if: :current_enrolment?
  

  def current_enrolment?
  	year_completed >= Date.today.year.to_s
  end
end
