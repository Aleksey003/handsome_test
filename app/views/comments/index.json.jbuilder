json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :hotel_id, :rating, :comment_text
  json.url comment_url(comment, format: :json)
end
