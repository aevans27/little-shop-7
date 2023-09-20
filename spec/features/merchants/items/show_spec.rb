require "rails_helper" 

RSpec.describe "Merchant's Item's Show Page" do 
  before(:each) do 
    load_test_data
  end
  it "shows a list of all of the item's attributes" do 
    visit "/merchants/#{@merchant1.id}/items/#{@item5.id}"

    within "#product_header" do 
      expect(page).to have_content(@item5.name)
    end

    within "#item_details" do 
      expect(page).to have_content("Item Description: #{@item5.description}")
      expect(page).to have_content("Current Selling Price: $4.00")
    end
  end

  it "has a link to edit the item" do 
    visit "/merchants/#{@merchant1.id}/items/#{@item36.id}"

    within "#link_to_edit" do
      expect(page).to have_link("Edit Item")
      click_link("Edit Item")
      expect(page).to have_current_path("/items/#{@item36.id}/edit")
    end
  end
end