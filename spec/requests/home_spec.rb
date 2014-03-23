require 'spec_helper'

describe 'home' do

  it 'loads' do
    visit root_path
    expect(page).to have_selector('div#map')
  end

end
