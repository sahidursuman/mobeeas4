json.array!(@engagements) do |engagement|
  json.extract! engagement, :id, :opportunity_id, :profile_id, :status
  json.url engagement_url(engagement, format: :json)
end
