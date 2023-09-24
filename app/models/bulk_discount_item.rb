class BulkDiscountItem < ApplicationRecord
  belongs_to :bulk_discount
  belongs_to :item
end