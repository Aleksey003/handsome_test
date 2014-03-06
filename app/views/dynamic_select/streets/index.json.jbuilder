json.array! (@streets) do |street|
    json.extract! street, :title, :id
end