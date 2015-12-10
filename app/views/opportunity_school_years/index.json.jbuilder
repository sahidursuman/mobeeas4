json.array!(@opportunity_school_years) do |opportunity_school_year|
  json.extract! opportunity_school_year, :id, :opportunity_id, :school_year_id, :number_of_students
  json.url opportunity_school_year_url(opportunity_school_year, format: :json)
end
