json.array!(@achievement_levels) do |achievement_level|
  json.extract! achievement_level, :id, :name
  json.url achievement_level_url(achievement_level, format: :json)
end
