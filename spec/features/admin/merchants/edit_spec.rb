require "rails_helper"

RSpec.describe "Admin Merchants Edit Page" do 
  it "has a header" do
    load_test_data

    visit "/admin/merchants/#{@merchant7.id}/edit"

    expect(page).to have_content("Admin: Merchant Section")
  end
end
  