require "rails_helper"

RSpec.describe Item, type: :model do
  describe "relationships" do
    it { should belong_to(:merchant) }
    it { should have_many :invoice_items }
    it { should have_many(:invoices).through(:invoice_items) }
    it { should have_many(:transactions).through(:invoices) }
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :merchant_id }
    it { should validate_presence_of :status }
  end

  it "can format a date" do
    merchant = Merchant.create!(name:"Bob")
    merchant.items.create!(name:"Bobs burger", description:"Burger", unit_price: 10, created_at: "2012-03-25 09:54:09 UTC")
    expect(merchant.items.first.formatted_date).to eq("Sunday, March 25, 2012")
  end
end