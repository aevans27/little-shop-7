require "rails_helper"

RSpec.describe "Merchant Bulk Discount Show page" do 
  before(:each) do 
    load_test_data
  end

  it "get to show page for discount" do 
    visit "merchants/#{@merchant1.id}/bulk_discounts/#{@discount1.id}"

    within "#discount_details" do 
      expect(page).to have_content("Discount is #{@discount1.discount} percent off")
      expect(page).to have_content("Threshold is #{@discount1.threshold} items")
    end
  end
end