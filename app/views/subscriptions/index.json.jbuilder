json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :user_type, :user_id, :organisation_id, :expiry_date, :payment
  json.url subscription_url(subscription, format: :json)
end
