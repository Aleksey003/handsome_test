json.array! (@states) do |state|
    json.extract! state, :title, :id
end