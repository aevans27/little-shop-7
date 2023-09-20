require "rails_helper"

RSpec.describe "Admin Merchan new page" do
  it "has a header" do
    load_test_data

    visit new_admin_merchant_path

    expect(page).to have_content("Admin: Merchant Section")
  end
end