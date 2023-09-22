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
    visit "merchants/#{@merchant1.id}/bulk_discounts"

    within "#merchant_discounts" do 
      expect(page).to have_content("Discount for 20 off when you buy 10")
    end
    # save_and_open_page

    click_button "Delete #{@discount1.discount} percent off"

    expect(current_path).to eq("/merchants/#{@merchant1.id}/bulk_discounts")
    
    within "#merchant_discounts" do 
    expect(page).not_to have_content("Discount for 20 off when you buy 10")
    end
  end
end