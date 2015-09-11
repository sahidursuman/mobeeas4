json.array!(@organisation_types) do |organisation_type|
  json.extract! organisation_type, :id, :name, :description
  json.url organisation_type_url(organisation_type, format: :json)
end
