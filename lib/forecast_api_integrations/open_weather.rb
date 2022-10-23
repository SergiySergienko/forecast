module ForecastApiIntegrations
  class OpenWeather

    API_KEY = Rails.configuration.open_weather['api_key']
    API_BASE_URL = 'https://api.openweathermap.org/data/2.5/weather'

    def self.fetch(lat_lon)
      url = get_api_url(lat_lon[0], lat_lon[1], API_KEY)
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Get.new(url)

      response = https.request(request)

      parse_response(response.read_body)
    end

    def self.get_api_url(lat, lon, api_key)
      uri = URI(self::API_BASE_URL)
      uri.query = { lat: lat, lon: lon, appid: api_key }.to_query
      uri
    end

    def self.parse_response(json_data)
      data = JSON.parse(json_data)
      result = {}

      result[:dt] = DateTime.now.to_s
      result[:main] = data['weather'].first['main']
      result[:temp] = data['main']['temp']
      result[:temp_min] = data['main']['temp_min']
      result[:temp_max] = data['main']['temp_max']
      result[:feels_like] = data['main']['feels_like']
      [result]
    end
  end
end