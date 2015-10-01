json.array!(@agreements) do |agreement|
  json.extract! agreement, :id, :user_id, :ethics, :code_of_conduct, :terms
  json.url agreement_url(agreement, format: :json)
end
