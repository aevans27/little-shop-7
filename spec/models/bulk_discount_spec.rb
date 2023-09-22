require "rails_helper"

# RSpec.describe Customer do
RSpec.describe BulkDiscount, type: :model do
  describe "relationships" do
    it { should belong_to(:merchant) }
    it { should validate_presence_of :discount }
    it { should validate_presence_of :threshold }
  end
end