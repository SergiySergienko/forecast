class HomeController < ApplicationController

    Representer = Struct.new(:dt, :main, :temp, :temp_min, :temp_max, :feels_like)

    before_action :set_start_time

    def set_start_time
        @start_time = Time.now.to_f
    end

    def index
        @validator = ::HomeValidator.new(params[:address])
        if params[:address].present? && @validator.valid?
            api_klass = (params[:api_type] == 'today' ? ForecastApiIntegrations::OpenWeather : ForecastApiIntegrations::OpenWeatherFiveDays)
            data = ForecastManager.get_data_with(api_klass, params[:address])

            @cache_flag = data[:cache_flag]
            @formatted_address = data[:address_data][:formatted_address]
            @forecast_data = data[:forecast_data]
        end
    end

end
