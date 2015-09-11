json.array!(@organisations) do |organisation|
  json.extract! organisation, :id, :organisation_type_id, :name, :contact_name, :contact_email, :contact_phone, :address, :suburb, :state, :postcode, :country, :logo, :website, :acara_school_id, :school_type, :latitude, :longitude
  json.url organisation_url(organisation, format: :json)
end
