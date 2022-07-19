class Order < ApplicationRecord
  belongs_to :customer, foreign_key: "customer_id"
  enum payment_method: { credit_card: 0, transfer: 1 }
end
