json.array!(@security_checks) do |security_check|
  json.extract! security_check, :id, :name, :state, :number, :expiry_date, :checked, :checked_by, :user_id
  json.url security_check_url(security_check, format: :json)
end
