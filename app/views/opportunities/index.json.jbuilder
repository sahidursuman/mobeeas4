json.array!(@opportunities) do |opportunity|
  json.extract! opportunity, :id, :organisation_id, :user_id, :opportunity_status, :name, :tagline, :info, :planned_start_date, :duration, :pay
  json.url opportunity_url(opportunity, format: :json)
end
