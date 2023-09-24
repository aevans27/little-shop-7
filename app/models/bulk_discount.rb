class BulkDiscount < ApplicationRecord
  belongs_to :merchant
  has_many :bulk_discount_items
  has_many :items, through: :bulk_discount_items
  has_many :invoice_items, through: items
  validates_presence_of :discount
  validates_presence_of :threshold
end