require "rails_helper"

RSpec.describe "Admin Merchants" do 
  
  it "shows the names of each merchant in the system" do 
    load_test_data

    visit '/admin/merchants'

    expect(page).to have_content(@merchant1.name)
    expect(page).to have_content(@merchant2.name)
    expect(page).to have_content(@merchant3.name)
    expect(page).to have_content(@merchant4.name)
    expect(page).to have_content(@merchant5.name)
    expect(page).to have_content(@merchant6.name)
    expect(page).to have_content(@merchant7.name)
    expect(page).to have_content(@merchant8.name)
    expect(page).to have_content(@merchant9.name)
    expect(page).to have_content(@merchant10.name)
  end

  it "has a enable button on disabled merchants" do
    merchant1= Merchant.create!(name: "No Face", status: "disabled")
    merchant2 = Merchant.create!(name: "Totoro", status: "enabled")
    merchant3 = Merchant.create!(name: "Kiki", status: "enabled")

    visit '/admin/merchants'
    
    expect(find("#merchant-#{merchant1.id}")).to have_button("Enable #{merchant1.name}")
  end

  it "has a disable button on enabled merchants" do
    merchant1= Merchant.create!(name: "No Face", status: "disabled")
    merchant2 = Merchant.create!(name: "Totoro", status: "enabled")
    merchant3 = Merchant.create!(name: "Kiki", status: "enabled")

    visit '/admin/merchants'
    
    expect(find("#merchant-#{merchant3.id}")).to have_button("Disable #{merchant3.name}")
  end

  it "has a disable button that changes the merchant status and returns you back to the merchant index" do
    merchant1= Merchant.create!(name: "No Face", status: "disabled")
    merchant2 = Merchant.create!(name: "Totoro", status: "enabled")
    merchant3 = Merchant.create!(name: "Kiki", status: "enabled")

    visit '/admin/merchants'
    
    expect(find("#merchant-#{merchant3.id}")).to have_button("Disable #{merchant3.name}")
    
    click_button "Disable #{merchant3.name}"
    
    expect(find("#merchant-#{merchant3.id}")).to have_button("Enable #{merchant3.name}")
  end

  it "has a enable button that changes the merchant status and returns you back to the merchant index" do
    merchant1= Merchant.create!(name: "No Face", status: "disabled")
    merchant2 = Merchant.create!(name: "Totoro", status: "enabled")
    merchant3 = Merchant.create!(name: "Kiki", status: "enabled")

    visit '/admin/merchants'
    
    expect(find("#merchant-#{merchant1.id}")).to have_button("Enable #{merchant1.name}")
    
    click_button "Enable #{merchant1.name}"
    
    expect(find("#merchant-#{merchant1.id}")).to have_button("Disable #{merchant1.name}")
  end

  it "creates new merchants with valid data" do
    load_test_data
    visit "/admin/merchants"
    
    expect(page).to have_link("Create a new merchant")
    click_link("Create a new merchant")
    expect(page).to have_current_path("/admin/merchants/new")

    expect(page).to have_content("Create new merchant")
    expect(find("form")).to have_content("Name")
    expect(page).to have_button("Submit")
    
    fill_in "Name", with: "Karl"
    click_button "Submit"

    expect(page).to have_current_path("/admin/merchants")
    expect(page).to have_content("Information has been successfully updated")
    expect(page).to have_content("Karl")
    expect(page).to have_button("Disable Karl")
  end

  # it "flashes an error given invalid data" do 
  #   load_test_data
  #   visit "/admin/merchants"

  #   visit "/admin/merchants/new"

  #   click_button "Submit"
  #   expect(page).to have_content("Error: All fields must be filled in to submit"
  #   redirect_to "/admin/merchants/new")
  # end

  it "has a enable button that changes the merchant status and returns you back to the merchant index" do
    merchant1= Merchant.create!(name: "No Face", status: "disabled")
    merchant2 = Merchant.create!(name: "Totoro", status: "enabled")
    merchant3 = Merchant.create!(name: "Kiki", status: "enabled")

    visit '/admin/merchants'
    
    expect("Enabled Merchants").to appear_before("Totoro")
    expect("Totoro").to appear_before("Disabled Merchants")
    expect("Disabled Merchants").to appear_before("No Face")
  end

  it "shows the top 5 merchants" do 
    load_best_test_data

    visit '/admin/merchants'
    expect(find("#top_5")).to have_content(@merchant2.name)
    expect(find("#top_5")).to have_content(@merchant3.name)
    expect(find("#top_5")).to have_content(@merchant5.name)
    expect(find("#top_5")).to have_content(@merchant7.name)
    expect(find("#top_5")).to have_content(@merchant1.name)
    expect(find("#top_5")).to_not have_content(@merchant4.name)
    expect(find("#top_5")).to_not have_content(@merchant6.name)
  end

  it "shows the best day for the top merchants" do
    load_best_test_data

    visit '/admin/merchants'

    expect(page).to have_content("Top selling date for #{@merchant2.name} was #{@merchant2.best_day}")
    expect(page).to have_content("Top selling date for #{@merchant3.name} was #{@merchant3.best_day}")
    expect(page).to have_content("Top selling date for #{@merchant5.name} was #{@merchant5.best_day}")
    expect(page).to have_content("Top selling date for #{@merchant7.name} was #{@merchant6.best_day}")
    expect(page).to have_content("Top selling date for #{@merchant1.name} was #{@merchant1.best_day}")
  end

  it "has a header" do
    load_test_data

    visit "/admin/merchants"

    expect(page).to have_content("Admin: Merchant Section")
  end

end