json.array!(@subscription_packs) do |subscription_pack|
  json.extract! subscription_pack, :id, :name, :price_ex_gst
  json.url subscription_pack_url(subscription_pack, format: :json)
end
