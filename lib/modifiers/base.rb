module Modifiers
  class Base
    def handle(data)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def get_cache_key(postal_code, api_klass)
      "#{api_klass.get_cache_prefix}_#{postal_code}"
    end
  end
end