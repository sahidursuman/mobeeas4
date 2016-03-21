json.array!(@reports) do |report|
  json.extract! report, :id, :opportunity_id, :type, :relevant_knowledge, :relevant_knowledge_comment, :punctual, :punctual_comment, :communication, :communication_comment, :enthusiasm, :enthusiasm_comment, :professionalism, :professionalism_comment, :strength, :further_dev, :general_comments
  json.url report_url(report, format: :json)
end
