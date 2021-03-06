require 'spec_helper'

describe FoodTruck do

  let(:sample_truck) { FactoryGirl.create(:food_truck) }

  it 'gets its address geocoded' do
    expect(sample_truck.longitude).to_not be_nil
    expect(sample_truck.latitude).to_not be_nil
  end

end
