class Education < ActiveRecord::Base
  belongs_to :user

  validates :institution, :course, :year_completed, presence: true
  # validates :terms, :acceptance => {:accept => true}, if: :current_enrolment?

  mount_uploader :achievement, PictureUploader

  def current_enrolment?
  	year_completed >= Date.today.year.to_s
  end

  scope :unverified, -> {where(verified: false)}

  def verify
    self.verified = true
    self.save!
  end

end
