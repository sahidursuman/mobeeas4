json.array!(@report_achievement_levels) do |report_achievement_level|
  json.extract! report_achievement_level, :id, :report_id, :achievement_level_id, :performance_descriptor
  json.url report_achievement_level_url(report_achievement_level, format: :json)
end
