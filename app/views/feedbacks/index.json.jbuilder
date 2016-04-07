json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :user_id, :message, :picture
  json.url feedback_url(feedback, format: :json)
end
