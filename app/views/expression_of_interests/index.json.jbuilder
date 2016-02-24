json.array!(@expression_of_interests) do |expression_of_interest|
  json.extract! expression_of_interest, :id, :sponsor_id, :opportunity_id, :approved
  json.url expression_of_interest_url(expression_of_interest, format: :json)
end
