class OrgUserProfile < ActiveRecord::Base
  belongs_to :user
  before_create :set_guid
  after_create :build_agreement
  validates :first_name, :last_name, :phone, :position, presence: true

  scope :admin_rank,->{where(admin_status: true, verified_status: true)}
  scope :user_rank,->{where(admin_status: false, verified_status: true)}
  scope :not_approved, -> {where(approved: false)}
  scope :approved, -> {where(approved: true)}

  def set_guid
    self.guid = SecureRandom.uuid
  end

  def name
		[first_name, last_name].compact.join(' ')
	end

  def build_agreement
		Agreement.create!(user_id: self.user.id)
	end

  def country_name(country_code)
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end


end
