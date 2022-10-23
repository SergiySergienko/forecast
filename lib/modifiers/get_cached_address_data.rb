module Modifiers
  class GetCachedAddressData < Base
    def handle(data)
      address_key = address_to_key(data[:address])
      data[:address_key] = address_key
      data[:address_data] = Rails.cache.read(address_key)

      data
    end

    private

    def address_to_key(address)
      ::Digest::SHA1.hexdigest(address)
    end
  end
end