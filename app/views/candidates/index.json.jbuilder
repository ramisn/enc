json.array!(@candidates) do |candidate|
  json.extract! candidate, :id, :first_name, :last_name, :email, :gender, :dob, :education, :website, :address, :address1, :city, :state, :zip, :home_phone, :mobile, :language, :cv
  json.url candidate_url(candidate, format: :json)
end
