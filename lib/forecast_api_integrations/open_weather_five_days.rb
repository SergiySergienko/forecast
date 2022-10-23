module ForecastApiIntegrations
  class OpenWeatherFiveDays < OpenWeather

    API_BASE_URL = 'https://api.openweathermap.org/data/2.5/forecast'

    def self.parse_response(json_data)
      data = JSON.parse(json_data)
      data['list'].map { |record| prepare_record(record) }
    end


    def self.prepare_record(data)
      result = {}
      result[:dt] = data['dt_txt']
      result[:main] = data['weather'].first['main']
      result[:temp] = data['main']['temp']
      result[:temp_min] = data['main']['temp_min']
      result[:temp_max] = data['main']['temp_max']
      result[:feels_like] = data['main']['feels_like']
      result
    end

    def self.get_cache_prefix
      'oweather_five'
    end
  end
end