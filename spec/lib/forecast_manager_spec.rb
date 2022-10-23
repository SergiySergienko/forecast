require 'rails_helper'
RSpec.describe ForecastManager do
  it { is_expected.to respond_to :get_data_with }
  it { is_expected.to respond_to :modifiers_chain }
end