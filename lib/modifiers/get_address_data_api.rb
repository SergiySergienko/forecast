module Modifiers
  class GetAddressDataApi < Base
    CACHE_EXPIRATION_TIME = 10.seconds

    def handle(data)
      return data unless data[:address_data].nil?

      geo_data = Geocoder.search(data[:address], lookup: :google_places_search)
      lat_lon = geo_data.first.coordinates
      formatted_address = geo_data.first.formatted_address

      geo_data = Geocoder.search(geo_data.first.place_id)
      postal_code = geo_data.first.postal_code || SecureRandom.uuid

      _data = { coordinates: lat_lon, postal_code: postal_code, formatted_address: formatted_address }
      data[:address_data] = _data

      Rails.cache.write(data[:address_key], _data, expires_in: CACHE_EXPIRATION_TIME)

      data
    end
  end
end