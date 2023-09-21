require "rails_helper"

# RSpec.describe Customer do
RSpec.describe BulkDiscount, type: :model do
  describe "relationships" do
    it { should belong_to(:merchant) }
  end
end