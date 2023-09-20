class Transaction < ApplicationRecord
  enum result: [:success, :failed]
  belongs_to :invoice
  validates_presence_of :invoice_id
  validates_presence_of :credit_card_number
  validates_presence_of :credit_card_expiration_date
  validates_presence_of :result
end