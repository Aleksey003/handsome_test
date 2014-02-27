json.array!(@hotels) do |hotel|
  json.extract! hotel, :id, :title, :room_description, :price_for_room, :breakfast_included
  json.url hotel_url(hotel, format: :json)
end
