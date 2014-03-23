require 'spec_helper'

describe "Food Truck" do

  let(:url) {'beths_skis.com'}

  let(:a_food_truck) { FactoryGirl.create(:food_truck, url: url) }

  before do
    visit food_truck_path(a_food_truck)
  end

  it 'should have map container' do
    expect(page).to have_selector("div#truck")
  end

  it 'should show the food truck name' do
    expect(page).to have_text(a_food_truck.name)
  end

  it 'should show the correct food truck url' do
    expect(a_food_truck.url).to be(url)
    expect(page).to have_text(a_food_truck.url)
  end

end
