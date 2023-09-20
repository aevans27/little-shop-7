require "rails_helper"

RSpec.describe "Admin Merchan new page" do
  it "has a header" do
    load_test_data

    visit new_admin_merchant_path

    expect(page).to have_content("Admin: Merchant Section")
  end
  
  it "creates new merchants with valid data" do
    load_test_data
    
    visit "/admin/merchants/new"

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

  it "flashes an error given invalid data" do 
    load_test_data
    
    visit "/admin/merchants/new"
    click_button "Submit"
    
    expect(page).to have_content("Error: All fields must be filled in to submit")
  end
end