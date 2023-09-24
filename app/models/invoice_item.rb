require "csv"

class InvoiceItem < ApplicationRecord
  enum status: [:pending, :packaged, :shipped]
  belongs_to :item
  belongs_to :invoice
  has_many :merchants, through: :items
  has_many :bulk_discounts, through: :item
  validates_presence_of :item_id
  validates_presence_of :invoice_id
  validates_presence_of :quantity
  validates_presence_of :unit_price
  validates_presence_of :status
end
