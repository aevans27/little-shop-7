require "rails_helper"

RSpec.describe "Bulk Discount Edit page" do 
  before(:each) do 
    load_test_data
  end

  it "edit a discount with wrong data" do 
    merchant = Merchant.create!(name: "Tempy")
    discount01= merchant.bulk_discounts.create!(discount:20, threshold:10)
    discount02= merchant.bulk_discounts.create!(discount:30, threshold:20)
    discount03= merchant.bulk_discounts.create!(discount:40, threshold:40)

    visit "merchants/#{merchant.id}/bulk_discounts/#{discount01.id}"

    expect(page).to have_content("Discount is #{discount01.discount} percent off")
    expect(page).to have_content("Threshold is #{discount01.threshold} items")

    within "#discount_details" do 
      click_link "Edit Discount"
    end

    fill_in 'Discount', with: ""
    fill_in 'Threshold', with: ""
    click_button 'Update Discount'

    fill_in 'Discount', with: "wrong"
    fill_in 'Threshold', with: "wrong"
    click_button 'Update Discount'

    fill_in 'Discount', with: 50
    fill_in 'Threshold', with: 100
    click_button 'Update Discount'

    within "#merchant_discounts" do 
      expect(page).to have_content("Discount for 50 off when you buy 100")
    end
  end

  it "cannot edit discount with pending invoice" do
    visit "merchants/#{@merchant1.id}/bulk_discounts/#{@discount1.id}"

    within "#discount_details" do 
      click_link "Edit Discount"
    end

    fill_in 'Discount', with: 50
    fill_in 'Threshold', with: 100
    click_button 'Update Discount'
    expect(page).to have_content("Discount applied to pending invoice, can't update")
  end
end