require "csv"

class Invoice < ApplicationRecord
  enum status: ["completed", "cancelled", "in progress"]
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :customer
  has_many :transactions
  validates_presence_of :customer_id
  validates_presence_of :status

  def self.incomplete
    where("status != 0")
  end

  def formatted_date
    created_at.strftime("%A, %B %d, %Y")
    # "Monday, July 18, 2019"
  end

  def total_revenue
    invoice_items.sum do |invoice_item|
      invoice_item.invoice_item_revenue
    end
  end

  def discounted_total_invoice
    if self.items.count != 0
      invoice_items.sum do |invoice_item|
        invoice_item.total_discount.to_f
      end
    else
      0
    end
  end

  def total_discounted_revenue
    total_revenue - discounted_total_invoice
  end
end