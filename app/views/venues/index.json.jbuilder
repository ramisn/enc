json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :status
  json.url venue_url(venue, format: :json)
end
