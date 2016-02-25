json.array!(@engagement_token_packs) do |engagement_token_pack|
  json.extract! engagement_token_pack, :id, :name, :price_ex_gst, :number_of_tokens
  json.url engagement_token_pack_url(engagement_token_pack, format: :json)
end
