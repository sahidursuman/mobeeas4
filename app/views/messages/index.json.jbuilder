json.array!(@messages) do |message|
  json.extract! message, :id, :user_id, :opportunity_id, :from, :to, :message_text, :status, :attachment
  json.url message_url(message, format: :json)
end
