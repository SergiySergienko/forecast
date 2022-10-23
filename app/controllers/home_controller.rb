class HomeController < ApplicationController
    def index
        @validator = ::HomeValidator.new(params[:address])
        if @validator.valid?
            data = ForecastManager.get_data_with(ForecastApiIntegrations::OpenWeather, params[:address])

            @cache_flag = data[:cache_flag]
            @forecast_data = OpenStruct.new(data[:forecast_data])
        end
    end

    def search
        render json: { success: true, data: [] }
    end
end
