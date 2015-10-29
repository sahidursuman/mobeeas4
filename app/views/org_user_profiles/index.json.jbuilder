json.array!(@org_user_profiles) do |org_user_profile|
  json.extract! org_user_profile, :id, :first_name, :last_name, :phone, :position, :guid, :user_id
  json.url org_user_profile_url(org_user_profile, format: :json)
end
