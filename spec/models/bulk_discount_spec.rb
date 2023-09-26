require "rails_helper"

RSpec.describe BulkDiscount, type: :model do
  describe "relationships" do
    it { should belong_to(:merchant) }
    it { should have_many(:bulk_discount_items) }
    it { should have_many(:items).through(:bulk_discount_items) }
    it { should have_many(:invoice_items).through(:items) }
    it { should validate_presence_of :discount }
    it { should validate_presence_of :threshold }
    it { should validate_numericality_of :threshold}
    it { should validate_numericality_of :discount}
  end
end