class Merchant <ApplicationRecord
  has_many :items
  has_many :bulk_discounts
  has_many :invoices, through: :items
  has_many :invoice_items, through: :items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  validates_presence_of :name
  enum status: ["disabled", "enabled"]

  def top_customers
    # find_by_sql(
    #   "SELECT customers.*, COUNT(invoices.status)
	  #   FROM customers 
	  #   INNER JOIN invoices ON invoices.customer_id = customers.id 
	  #   GROUP BY customers.id
	  #   ORDER BY count DESC
	  #   LIMIT 5")
    
      self.customers.select("customers.*, COUNT(transactions.id)")
      .joins(:transactions)
      .where("transactions.result = 0")
      .group("customers.id")
      .order("count desc")
      .limit(5)
  end

  def items_to_ship
      self.items.select("items.*, invoice_items.invoice_id, invoices.created_at")
      .joins(invoices: :invoice_items)
      .where("invoice_items.status != 2")
      .order(:invoice_id)
      .distinct
  end

  def self.top_merchants
    find_by_sql(
      "SELECT merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS total_cost, MAX(invoices.updated_at) AS most_recent FROM merchants 
	    INNER JOIN items ON items.merchant_id = merchants.id 
	    INNER JOIN invoice_items ON invoice_items.item_id = items.id 
	    INNER JOIN invoices ON invoices.id = invoice_items.invoice_id
	   	INNER JOIN transactions ON transactions.invoice_id = invoices.id
	    WHERE transactions.result = 0
	    GROUP BY merchants.id
	    ORDER BY total_cost DESC, most_recent DESC
	    LIMIT (5)"
    )
  end

  def best_day
    best_day_data.updated_at.strftime("%A, %B %d, %Y")
  end

  def most_popular_items
    items.select("items.*, invoices.updated_at, SUM(invoice_items.quantity * invoice_items.unit_price)")
    .joins(invoices: :transactions)
    .where("transactions.result = 0")
    .group("items.id, invoices.updated_at")
    .order("sum desc")
    .limit(5)
  end

private

  def best_day_data
    invoices.select("invoices.updated_at, sum(invoice_items.quantity * invoice_items.unit_price) AS thesum")
            .group("invoices.updated_at")
            .order("thesum desc, invoices.updated_at")
            .first
  end
end