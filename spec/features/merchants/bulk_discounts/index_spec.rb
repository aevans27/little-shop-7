require "rails_helper"

RSpec.describe "Merchant Bulk Discount Index page" do 
  before(:each) do 
    load_test_data
  end
  it "shows a list of all my items" do 
    visit "merchants/#{@merchant1.id}"

    # within "#merchant_name" do 
    #   expect(page).to have_content(@merchant1.name)
    # end

    # within "#merchant_invoices" do 
    #   expect(page).to have_content(@invoice_1.id)
    # end
  end
end