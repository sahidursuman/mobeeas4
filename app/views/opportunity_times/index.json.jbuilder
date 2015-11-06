json.array!(@opportunity_times) do |opportunity_time|
  json.extract! opportunity_time, :id, :time, :date, :day, :frequency, :opportunity_id
  json.url opportunity_time_url(opportunity_time, format: :json)
end
