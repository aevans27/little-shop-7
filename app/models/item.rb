class Item < ApplicationRecord
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices
  belongs_to :merchant
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price
  validates_presence_of :merchant_id
  validates_presence_of :status
  enum status: ["disabled", "enabled"]

  def formatted_date
    created_at.strftime("%A, %B %d, %Y")
    # "Monday, July 18, 2019"
  end
end