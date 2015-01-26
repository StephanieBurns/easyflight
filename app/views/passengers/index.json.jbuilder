json.array!(@passengers) do |passenger|
  json.extract! passenger, :id, :first_name, :last_name, :flight_id
  json.url passenger_url(passenger, format: :json)
end
