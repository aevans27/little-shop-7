require "csv"

class InvoiceItem < ApplicationRecord
  enum status: [:pending, :packaged, :shipped]
  belongs_to :item
  belongs_to :invoice
  has_many :merchants, through: :item
  has_many :bulk_discounts, through: :merchants
  validates_presence_of :item_id
  validates_presence_of :invoice_id
  validates_presence_of :quantity
  validates_presence_of :unit_price
  validates_presence_of :status

  def total_discount
    if top_bulk_discount != nil
      (invoice_item_revenue * (top_bulk_discount.discount.to_f/100)).round(0)
    else
      0
    end
  end

  def invoice_item_revenue
    quantity * unit_price.to_f
  end

  def top_bulk_discount
    bulk_discounts.where("threshold <= ?", quantity)
    .order("discount desc").first
  end
end
