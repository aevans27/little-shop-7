class BulkDiscount < ApplicationRecord
  belongs_to :merchant
  validates_presence_of :discount
  validates_presence_of :threshold
end