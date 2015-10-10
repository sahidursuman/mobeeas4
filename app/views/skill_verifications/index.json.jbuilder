json.array!(@skill_verifications) do |skill_verification|
  json.extract! skill_verification, :id, :user_id, :referree_name, :referree_email, :referree_phone, :referree_relationship, :time_known, :work_ethic, :communication, :presentation, :accomplishments
  json.url skill_verification_url(skill_verification, format: :json)
end
