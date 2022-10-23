module Modifiers
  class GetCachedForecastData < Base
    def handle(data)
      cache_key = get_cache_key(data[:address_data][:postal_code], data[:api_klass])
      return data unless Rails.cache.exist?(cache_key)

      data[:forecast_data] = Rails.cache.read(cache_key)
      data[:cache_flag] = true

      data
    end

  end
end