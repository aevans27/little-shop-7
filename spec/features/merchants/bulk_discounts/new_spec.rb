require "rails_helper"

RSpec.describe "Merchant Bulk Discount New page" do 
  before(:each) do 
    load_test_data
  end

  it "can create a new discounts not with wrong data type" do
    visit "merchants/#{@merchant1.id}/bulk_discounts"
    click_link "Create Discount"
    click_button 'Submit'

    fill_in 'Discount', with: ""
    fill_in 'Threshold', with: ""
    click_button 'Submit'

    fill_in 'Discount', with: "wrong"
    fill_in 'Threshold', with: "wrong"
    click_button 'Submit'

    fill_in 'Discount', with: 50
    fill_in 'Threshold', with: 100
    click_button 'Submit'

    expect(current_path).to eq("/merchants/#{@merchant1.id}/bulk_discounts")

    within "#merchant_discounts" do 
      expect(page).to have_content(50)
      expect(page).to have_content(100)
    end
  end

  it "can not create duplicate discounts" do
    visit "merchants/#{@merchant1.id}/bulk_discounts"
    click_link "Create Discount"
    click_button 'Submit'

    fill_in 'Discount', with: 20
    fill_in 'Threshold', with: 10
    click_button 'Submit'

    expect(current_path).to eq("/merchants/#{@merchant1.id}/bulk_discounts/new")
    expect(page).to have_content("Error: Merchant discount already exists")
  end
end