class BulkDiscount < ApplicationRecord
  belongs_to :merchant
  has_many :bulk_discount_items
  has_many :items, through: :bulk_discount_items
  has_many :invoice_items, through: :items
  validates_presence_of :discount
  validates_presence_of :threshold
  validates_numericality_of :discount, :only_integer => true
  validates_numericality_of :threshold, :only_integer => true

  def is_not_valid_discount
    false
  end
end