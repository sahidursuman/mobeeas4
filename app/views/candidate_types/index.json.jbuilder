json.array!(@candidate_types) do |candidate_type|
  json.extract! candidate_type, :id, :name, :description
  json.url candidate_type_url(candidate_type, format: :json)
end
