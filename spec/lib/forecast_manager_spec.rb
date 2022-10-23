require 'rails_helper'

RSpec.describe ForecastManager do
  subject { ForecastManager }

  it { is_expected.to respond_to :get_data_with }
  it { is_expected.to respond_to :modifiers_chain }

  context '#get_data_with' do
    let!(:modifier_instance) { double('SomeModifierClass') }

    before { allow(ForecastManager).to receive(:modifiers_chain).and_return [modifier_instance] }
    after { ForecastManager.get_data_with('test', 'test') }

    it { expect(modifier_instance).to receive(:handle) }
  end
end