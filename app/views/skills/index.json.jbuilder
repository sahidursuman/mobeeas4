json.array!(@skills) do |skill|
  json.extract! skill, :id, :skill_category_id, :name, :description
  json.url skill_url(skill, format: :json)
end
