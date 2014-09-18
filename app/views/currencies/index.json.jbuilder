json.array!(@currencies) do |currency|
  json.extract! currency, :id, :name, :iso_code, :leading_symbol, :trailing_symbol, :thousands_separator, :decimal_separator, :active
  json.url currency_url(currency, format: :json)
end
