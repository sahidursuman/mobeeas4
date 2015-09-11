json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :first_name, :last_name, :picture, :bio, :address, :suburb, :state, :postcode, :country, :phone, :website, :latitude, :longitude
  json.url profile_url(profile, format: :json)
end
