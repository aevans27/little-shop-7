require "rails_helper"

RSpec.describe Customer, type: :model do
  describe "relationships" do
    it { should have_many :invoices }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end

  describe "has custom methods" do
    before(:each) do
      load_test_data
    end

    it "can display top customers" do
      expect(Customer.top_customers).to match_array([@customer_1, @customer_2, @customer_4, @customer_3, @customer_5])
    end
  end
end