json.array!(@enquiries) do |enquiry|
  json.extract! enquiry, :id, :enquiry_type, :name, :email, :phone, :company, :message
  json.url enquiry_url(enquiry, format: :json)
end
