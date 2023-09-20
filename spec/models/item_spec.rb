require "rails_helper"

RSpec.describe Item, type: :model do
  describe "relationships" do
    it { should belong_to(:merchant) }
    it { should have_many :invoice_items }
    it { should have_many(:invoices).through(:invoice_items) }
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :merchant_id }
    it { should validate_presence_of :status }

  end

  it "can format a date" do
    @customer_1 = Customer.create!(first_name: "Frodo", last_name: "Baggins")

    @invoice_1k = Invoice.create!(status: "completed", customer: @customer_1, created_at: "2012-03-25 09:54:09 UTC")

    expect(@invoice_1k.formatted_date).to eq("Sunday, March 25, 2012")
  end
end