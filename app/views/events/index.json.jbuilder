json.array!(@events) do |event|
  json.extract! event, :id, :name, :date, :venue, :category
  json.url event_url(event, format: :json)
end
