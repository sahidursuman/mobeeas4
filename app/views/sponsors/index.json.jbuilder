json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :first_name, :last_name, :organisation, :position, :phone1, :phone2, :address, :suburb, :state, :postcode, :country, :guid, :user_id
  json.url sponsor_url(sponsor, format: :json)
end
