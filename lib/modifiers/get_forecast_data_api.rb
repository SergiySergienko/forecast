module Modifiers
  class GetForecastDataApi < Base
    CACHE_EXPIRATION_TIME = 10.seconds

    def handle(data)
      return data if data.has_key?(:forecast_data)

      data[:cache_flag] = false
      _data = data[:api_klass].fetch(data[:address_data][:coordinates])
      data[:forecast_data] = _data
      Rails.cache.write(data[:address_data][:postal_code], _data, expires_in: CACHE_EXPIRATION_TIME)

      data
    end
  end
end