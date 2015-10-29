json.array!(@org_users) do |org_user|
  json.extract! org_user, :id, :admin_status, :verified_status, :organisation_id, :user_id
  json.url org_user_url(org_user, format: :json)
end
