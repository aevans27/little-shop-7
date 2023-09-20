require "rails_helper"

RSpec.describe Invoice, type: :model do
  describe "relationships" do
    it { should belong_to(:customer) }
    it { should have_many :transactions }
    it { should have_many :invoice_items }
    it { should have_many(:items).through(:invoice_items) }
    it { should validate_presence_of :customer_id }
    it { should validate_presence_of :status }
  end

  describe "can do caculations" do
    it "can return incomplete transactions" do
      @customer_1 = Customer.create!(first_name: "Frodo", last_name: "Baggins")
      @customer_2 = Customer.create!(first_name: "Samwise", last_name: "Gamgee")
      @customer_3 = Customer.create!(first_name: "Meridoc", last_name: "Brandybuck")

      @invoice_1k = Invoice.create!(status: "completed", customer: @customer_1)
      @invoice_1l = Invoice.create!(status: "completed", customer: @customer_1)
      @invoice_2a = Invoice.create!(status: "in progress", customer: @customer_2)
      @invoice_2d = Invoice.create!(status: "in progress", customer: @customer_2)
      @invoice_3a = Invoice.create!(status: "cancelled", customer: @customer_3)
      @invoice_3b = Invoice.create!(status: "cancelled", customer: @customer_3)
      
      expect(Invoice.incomplete).to eq([@invoice_2a, @invoice_2d, @invoice_3a, @invoice_3b])
    end

    it "can format a date" do
      @customer_1 = Customer.create!(first_name: "Frodo", last_name: "Baggins")

      @invoice_1k = Invoice.create!(status: "completed", customer: @customer_1, created_at: "2012-03-25 09:54:09 UTC")

      expect(@invoice_1k.formatted_date).to eq("Sunday, March 25, 2012")
    end

    it "can find total_revenue" do
      load_test_data

      expect(@invoice_1a.total_revenue).to eq(23400)
    end

    it "can find total_revenue if revenue is zero" do
      load_best_test_data

      expect(@invoice_14.total_revenue).to eq(0)
    end
  end
end