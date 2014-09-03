json.array!(@countries) do |country|
  json.extract! country, :id, :name, :in_the_eu, :currency_id
  json.url country_url(country, format: :json)
end
