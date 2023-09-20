require "rails_helper"

RSpec.describe "Admin Merchants Edit Page" do 
  it "has a header" do
    load_test_data

    visit edit_admin_merchant_path(@merchant7)

    expect(page).to have_content("Admin: Merchant Section")
  end
end
  