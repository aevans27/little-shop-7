require "csv"

class Invoice < ApplicationRecord
  enum status: ["completed", "cancelled", "in progress"]
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_one :merchant, through: :items
  has_many :bulk_discounts, through: :merchant
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
    if self.items.count != 0
      items.select("SUM(invoice_items.quantity * items.unit_price) AS total")[0].total
    else
      0
    end
  end

  def discounted_total_revenue
    if self.items.count != 0
      items.select("SUM((invoice_items.quantity * items.unit_price) * ((100 - bulk_discounts.discount) * 0.01)) AS total")[0]
      .joins(:bulk_discounts)
      .where("invoice_items.quantity >= bulk_discounts.discount")
      .group("items.id")
      .total
    else
      0
    end
  end
end