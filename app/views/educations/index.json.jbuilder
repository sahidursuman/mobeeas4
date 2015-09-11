json.array!(@educations) do |education|
  json.extract! education, :id, :user_id, :institution, :course, :year_completed
  json.url education_url(education, format: :json)
end
