
require 'rails_helper'

RSpec.describe 'the item edit' do
  before(:each) do 
    load_test_data
  end
  it 'can edit the item and check for bad vaules' do
    visit "/merchants/#{@merchant1.id}/items/#{@item36.id}"
    click_link 'Edit Item'
    fill_in 'Name', with: ''
    fill_in 'Description', with: ''
    fill_in 'Unit price', with: ''
    click_button 'Update Item'

    fill_in 'Name', with: 'Tumbler'
    fill_in 'Description', with: 'HOLD UR WATR'
    fill_in 'Unit price', with: '90000'
    click_button 'Update Item'

    expect(current_path).to eq("/merchants/#{@merchant1.id}/items")

    within "#all_merchant_items" do 
      expect(page).to have_content('Tumbler')
    end

    visit "/merchants/#{@merchant1.id}/items/#{@item36.id}"

    within "#item_details" do 
      expect(page).to have_content("Item Description: HOLD UR WATR")
      expect(page).to have_content("Current Selling Price: $900.00")
    end
  end
end
