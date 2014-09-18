class CurrencySerializer < ActiveModel::Serializer
  attributes :id, :name, :iso_code, :leading_symbol, :trailing_symbol, :thousands_separator, :decimal_separator, :active
end
