json.array!(@engagement_token_packs) do |engagement_token_pack|
  json.extract! engagement_token_pack, :id, :name, :member_price, :non_member_price, :number_of_tokens
  json.url engagement_token_pack_url(engagement_token_pack, format: :json)
end
