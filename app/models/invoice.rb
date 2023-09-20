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
    if self.items.count != 0
      items.select("SUM(invoice_items.quantity * items.unit_price) AS total")[0].total
    else
      0
    end
  end
end