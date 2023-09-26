require "rails_helper"

RSpec.describe "Merchant Bulk Discount Index page" do 
  before(:each) do 
    load_test_data
  end
  it "shows a list of all discounts" do 
    visit "merchants/#{@merchant1.id}"
    click_link "My Discounts"

    within "#merchant_discounts" do 
      expect(page).to have_content(@discount1.discount)
      expect(page).to have_content(@discount1.threshold)
    end
  end

  it "can delete discounts" do
    merchant = Merchant.create!(name: "Tempy")
    discount01= merchant.bulk_discounts.create!(discount:20, threshold:10)
    discount02= merchant.bulk_discounts.create!(discount:30, threshold:20)
    discount03= merchant.bulk_discounts.create!(discount:40, threshold:40)

    visit "merchants/#{merchant.id}/bulk_discounts"

    within "#merchant_discounts" do 
      expect(page).to have_content("Discount for 20 off when you buy 10")
    end

    click_button "Delete #{discount01.discount} percent off"

    expect(current_path).to eq("/merchants/#{merchant.id}/bulk_discounts")
    
    within "#merchant_discounts" do 
    expect(page).not_to have_content("Discount for 20 off when you buy 10")
    end
  end

  it "cannot delete discount with pending invoice" do
    visit "merchants/#{@merchant1.id}/bulk_discounts"

    click_button "Delete #{@discount1.discount} percent off"

    expect(page).to have_content("Discount applied to pending invoice, can't delete")
  end

  it "can delete discount with not pending invoices" do
    visit "merchants/#{@merchant5.id}/bulk_discounts"

    click_button "Delete #{@discount10.discount} percent off"

    expect(page).to have_content("Discount has been deleted")
  end
end