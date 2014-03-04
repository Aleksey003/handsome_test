json.array!(@cities) do |city|
  json.extract! city, :id, :title, :state_id
  json.url city_url(city, format: :json)
end
