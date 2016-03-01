class Sponsor < ActiveRecord::Base
  belongs_to :user
  mount_uploader :logo, PictureUploader
  validates :first_name, :last_name, :organisation, :phone1, :address, :suburb, :state, :postcode, :country, :position, presence: true
  has_many :expression_of_interests
  has_many :opportunities, through: :expression_of_interests

  def name
		[first_name, last_name].compact.join(' ')
	end

  def country_name(country_code)
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end

end
