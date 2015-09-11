json.array!(@opportunity_applications) do |opportunity_application|
  json.extract! opportunity_application, :id, :user_id, :opportunity_id, :introduction, :application_status
  json.url opportunity_application_url(opportunity_application, format: :json)
end
