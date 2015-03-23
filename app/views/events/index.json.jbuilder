json.array!(@events) do |event|
  json.(event, :id, :title, :lecturer, :description)
  json.start event.start_time
  json.end event.end_time
end