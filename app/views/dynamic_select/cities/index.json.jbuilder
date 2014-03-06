json.array! (@cities) do |city|
    json.extract! city, :title, :id
end