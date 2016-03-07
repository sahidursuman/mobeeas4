json.array!(@token_purchases) do |token_purchase|
  json.extract! token_purchase, :id, :user_id, :organisation_id, :number_of_tokens, :payment
  json.url token_purchase_url(token_purchase, format: :json)
end
