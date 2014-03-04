json.array!(@streets) do |street|
  json.extract! street, :id, :title, :city_id
  json.url street_url(street, format: :json)
end
