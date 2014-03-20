require 'spec_helper'

describe 'home' do

  it 'loads' do
    visit root_path
    expect(page).to have_text "Food Truck Rodeo"
  end

end
