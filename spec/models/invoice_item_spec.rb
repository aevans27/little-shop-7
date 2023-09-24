require "rails_helper"

RSpec.describe InvoiceItem, type: :model do
  describe "relationships" do
    it {should belong_to :invoice}
    it {should belong_to :item}
    it { should have_many(:merchants).through(:item) }
    it { should have_many(:bulk_discounts).through(:item) }
    it { should validate_presence_of :item_id }
    it { should validate_presence_of :invoice_id }
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :status }
  end

  it "#total_discount" do
    load_test_data
    expect(@invoice_items1.total_discount).to eq(81679)
  end

  it "#invoice_item_revenue" do
    load_test_data
    expect(@invoice_items1.invoice_item_revenue).to eq(408395.0)
  end

  it "#top_bulk_discount" do
    load_test_data
    expect(@invoice_items1.top_bulk_discount).to eq(@discount1)
  end
end