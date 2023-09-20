require "rails_helper"

RSpec.describe "the merchant show" do
  it "shows the merchants name" do
    merchant_1 = Merchant.create(name: "Bob Burger")

    visit merchant_path(merchant_1)
    within "#merchant_name"
    expect(page).to have_content(merchant_1.name)
  end

  it "displays a link to the merchant items idex page and a link to the merchant invoices index" do 
    merchant = Merchant.create(name: "Bob Burger")

    visit merchant_path(merchant)

    expect(page).to have_link('My Items')
    expect(page).to have_link('My Invoices')

  end

  describe "advanced features" do
    before(:each) do
      load_test_data
    end

  it "gives top 5 customers and items bought" do

    visit merchant_path(@merchant1)

    within "#top_five"
      expect(page).to have_content(@customer_1.first_name)
      expect(page).to have_content(@customer_1.last_name)
      expect(page).to have_content(@customer_2.first_name)
      expect(page).to have_content(@customer_2.last_name)
      expect(page).to have_content(40)
      expect(page).to have_content(12)
   end
  it "gives not shipped items and ids and dates" do

    visit merchant_path(@merchant1)
    
    within "#ready_to_ship"
      expect(page).to have_content(@customer_1.first_name)
      expect(page).to have_content(@customer_1.last_name)
      expect(page).to have_content(@customer_2.first_name)
      expect(page).to have_content(@customer_2.last_name)
      expect(page).to have_content(40)
      expect(page).to have_content(12)
   end
  end
end