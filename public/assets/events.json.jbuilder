json.array!(@events) do |event|
  json.extract! event, :id, :title, :lecturer, :description
  json.start event.start_time
  json.end event.end_time
end