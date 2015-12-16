class SecurityCheck < ActiveRecord::Base
  belongs_to :user

  scope :unverified, -> {where(verified: false)}

  def verify(user)
    @user = User.find(user)
    self.verified = true
    self.checked_by = @user.id
    self.save!
  end

  validates :name, :state, :number, :expiry_date, presence: true


end
