json.array!(@candidates) do |candidate|
  json.extract! candidate, :id, :name, :sex, :dob, :addrs, :email, :mobile
  json.url candidate_url(candidate, format: :json)
end
