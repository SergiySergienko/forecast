class ForecastManager

  def self.get_data_with(integration_klass, address)
    data = { address: address, api_klass: integration_klass }

    result = self.modifiers_chain.reduce(data) { |hash, executor| data = executor.handle(data); data }

    result
  end

  def self.modifiers_chain
    [
      Modifiers::GetCachedAddressData.new,
      Modifiers::GetAddressDataApi.new,
      Modifiers::GetCachedForecastData.new,
      Modifiers::GetForecastDataApi.new,
    ]
  end

end