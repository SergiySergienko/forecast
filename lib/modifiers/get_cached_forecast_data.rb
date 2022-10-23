module Modifiers
  class GetCachedForecastData < Base
    def handle(data)
      return data unless Rails.cache.exist?(data[:address_data][:postal_code])

      data[:forecast_data] = Rails.cache.read(data[:address_data][:postal_code])
      data[:cache_flag] = true

      data
    end
  end
end