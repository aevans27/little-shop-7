require "rails_helper"

RSpec.describe "Merchant Item Index page" do 
  before(:each) do 
    load_test_data
  end
  it "shows a list of all my items" do 
    visit "merchants/#{@merchant1.id}/items"

    within "#merchant_name" do 
      expect(page).to have_content(@merchant1.name)
    end

    within "#all_merchant_items" do 
      expect(page).to have_content("Colgate")
      expect(page).to have_content("Red Bell Pepper")
      expect(page).to have_content("Huskies")
      expect(page).to have_content("Gatorade")
      expect(page).to have_content("Pretzels")
      expect(page).to have_content("Chicken Breast")
      expect(page).to have_content("Coors")
      expect(page).to have_content("Mug")
    end
  end

  it "doesn't show the items of any other merchant" do 
    visit "merchants/#{@merchant1.id}/items"

    within "#all_merchant_items" do 
      expect(page).to_not have_content("Book")
      expect(page).to_not have_content("Card")
      expect(page).to_not have_content("Bag")
      expect(page).to_not have_content("Keychain")
      expect(page).to_not have_content("Lamp")
      expect(page).to_not have_content("Mouse")
      expect(page).to_not have_content("Clip")
      expect(page).to_not have_content("Shelf")
      expect(page).to_not have_content("Hook")
    end
  end

  it "has a link to each item's show page" do 
    visit "merchants/#{@merchant1.id}/items"

    within "#all_merchant_items" do 
      expect(page).to have_link 'Colgate'
      expect(page).to have_link 'Red Bell Pepper'
      expect(page).to have_link 'Huskies'
      expect(page).to have_link 'Gatorade'
      expect(page).to have_link 'Pretzels'
      expect(page).to have_link 'Chicken Breast'
      expect(page).to have_link 'Coors'
      expect(page).to have_link 'Mug'
    end
  end

  it "takes you to the merchant's item's show page when you click the item's link" do 
    visit "merchants/#{@merchant1.id}/items"

    within "#all_merchant_items" do 
      click_link 'Colgate'
      expect(page).to have_current_path("/merchants/#{@merchant1.id}/items/#{@item1.id}")
    end
  
    visit "merchants/#{@merchant1.id}/items"
    within "#all_merchant_items" do 
      click_link 'Red Bell Pepper'
      expect(page).to have_current_path("/merchants/#{@merchant1.id}/items/#{@item2.id}")
    end

    visit "merchants/#{@merchant1.id}/items"
    within "#all_merchant_items" do 
      click_link 'Huskies'
      expect(page).to have_current_path("/merchants/#{@merchant1.id}/items/#{@item3.id}")
    end
    
    visit "merchants/#{@merchant1.id}/items"
    within "#all_merchant_items" do 
      click_link 'Gatorade'
      expect(page).to have_current_path("/merchants/#{@merchant1.id}/items/#{@item4.id}")
    end
    
    visit "merchants/#{@merchant1.id}/items"
    within "#all_merchant_items" do 
      click_link 'Pretzels'
      expect(page).to have_current_path("/merchants/#{@merchant1.id}/items/#{@item5.id}")
    end

    visit "merchants/#{@merchant1.id}/items"
    within "#all_merchant_items" do 
      click_link 'Chicken Breast'
      expect(page).to have_current_path("/merchants/#{@merchant1.id}/items/#{@item6.id}")
    end

    visit "merchants/#{@merchant1.id}/items"
    within "#all_merchant_items" do 
      click_link 'Coors'
      expect(page).to have_current_path("/merchants/#{@merchant1.id}/items/#{@item7.id}")
    end

    visit "merchants/#{@merchant1.id}/items"
    within "#all_merchant_items" do 
      click_link 'Mug'
      expect(page).to have_current_path("/merchants/#{@merchant1.id}/items/#{@item36.id}")

    end
  end

  describe "#enable/disable buttons" do 
    it "has a enable button on disabled items" do
      merchant1= Merchant.create!(name: "No Face", status: "disabled")
      merchant2 = Merchant.create!(name: "Totoro", status: "enabled")
  
      item1 = Item.create!(name: "Chair", description: "you sit on it", unit_price: 2000, merchant: merchant1, status: "disabled")
      item2 = Item.create!(name: "Table", description: "you eat off it", unit_price: 3000, merchant: merchant1, status: "enabled")
      item3 = Item.create!(name: "Flower pot", description: "you plant in it", unit_price: 1000, merchant: merchant2, status: "disabled")
      item4 = Item.create!(name: "Gate", description: "you go through it", unit_price: 6000, merchant: merchant2, status: "enabled")
      
  
      visit "/merchants/#{merchant1.id}/items"

  
      within "#all_merchant_items" do 
        expect(page).to have_button("Enable #{item1.name}")
      end
  
      visit "/merchants/#{merchant1.id}/items"
  
      within "#all_merchant_items" do 
        expect(page).to have_button("Enable #{item1.name}")
      end
    end
  
    it "has a disable button on enabled items" do
      merchant1= Merchant.create!(name: "No Face", status: "disabled")
      merchant2 = Merchant.create!(name: "Totoro", status: "enabled")
  
      item1 = Item.create!(name: "Chair", description: "you sit on it", unit_price: 2000, merchant: merchant1, status: "disabled")
      item2 = Item.create!(name: "Table", description: "you eat off it", unit_price: 3000, merchant: merchant1, status: "enabled")
      item3 = Item.create!(name: "Flower pot", description: "you plant in it", unit_price: 1000, merchant: merchant2, status: "disabled")
      item4 = Item.create!(name: "Gate", description: "you go through it", unit_price: 6000, merchant: merchant2, status: "enabled")
      
      visit "/merchants/#{merchant1.id}/items"
  
      within "#all_merchant_items" do 
        expect(page).to have_button("Disable #{item2.name}")
      end
    end
  
    it "has a enable button that changes the item status and returns you back to the items index" do
      merchant1= Merchant.create!(name: "No Face", status: "disabled")
      merchant2 = Merchant.create!(name: "Totoro", status: "enabled")
  
      item1 = Item.create!(name: "Chair", description: "you sit on it", unit_price: 2000, merchant: merchant1, status: "disabled")
      item2 = Item.create!(name: "Table", description: "you eat off it", unit_price: 3000, merchant: merchant1, status: "enabled")
      item3 = Item.create!(name: "Flower pot", description: "you plant in it", unit_price: 1000, merchant: merchant2, status: "disabled")
      item4 = Item.create!(name: "Gate", description: "you go through it", unit_price: 6000, merchant: merchant2, status: "enabled")
  
      visit "/merchants/#{merchant2.id}/items"

      within "#all_merchant_items" do 
        expect(page).to have_button("Enable #{item3.name}")
  
        click_button("Enable #{item3.name}")
        expect(current_path).to eq("/merchants/#{merchant2.id}/items")
  
        expect(page).to have_button("Disable #{item3.name}")
      end
    end
  
    it "has a enable button that changes the item status and returns you back to the item index" do
      merchant1= Merchant.create!(name: "No Face", status: "disabled")
      merchant2 = Merchant.create!(name: "Totoro", status: "enabled")
  
      item1 = Item.create!(name: "Chair", description: "you sit on it", unit_price: 2000, merchant: merchant1, status: "disabled")
      item2 = Item.create!(name: "Table", description: "you eat off it", unit_price: 3000, merchant: merchant1, status: "enabled")
      item3 = Item.create!(name: "Flower pot", description: "you plant in it", unit_price: 1000, merchant: merchant2, status: "disabled")
      item4 = Item.create!(name: "Gate", description: "you go through it", unit_price: 6000, merchant: merchant2, status: "enabled")
  
      visit "/merchants/#{merchant2.id}/items"
  
      within "#all_merchant_items" do 
        expect(page).to have_button("Disable #{item4.name}")
  
        click_button("Disable #{item4.name}")
        expect(current_path).to eq("/merchants/#{merchant2.id}/items")
  
        expect(page).to have_button("Enable #{item3.name}")
      end
      
    end

  end

  it "has a link new form to create item" do 
    visit "merchants/#{@merchant1.id}/items"
    click_link "Add Item"
    fill_in "Name", with: "Chocolate Bar"
    fill_in "Description", with: "Bar of chocolate"
    fill_in "Price", with: 2
    click_button "Submit"

    expect(page).to have_content("Chocolate Bar")
    expect(page).to have_content("Bar of chocolate")
    expect(page).to have_content(2)
    expect(page).to have_content("disabled")
  end

  it "find 5 most popular ranked by total revenue generated" do
    visit "merchants/#{@merchant3.id}/items"
    within "#popular_merchant_items" do 
    expect(page).to have_content("Colgate")
    expect(page).to have_content("$4,083.95")
    expect(page).to have_content("Red Bell Pepper")
    expect(page).to have_content("$4,083.95")
    expect(page).to have_content("Huskies")
    expect(page).to have_content("$4,083.95")
    end
  end

  it "top items best day" do
    visit "merchants/#{@merchant3.id}/items"
    within "#popular_merchant_items" do 
      expect(page).to have_content("Top selling date for Colgate was #{@invoice_4c.updated_at.strftime("%A, %B %d, %Y")}")
    end
  end
end