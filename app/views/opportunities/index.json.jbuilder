json.array!(@opportunities) do |opportunity|
  json.extract! opportunity, :id, :organisation_id, :user_id, :opportunity_status, :name, :tagline, :info, :planned_start_date, :duration, :pay, :commencement_date, :completion_date
  json.url opportunity_url(opportunity, format: :json)
end
