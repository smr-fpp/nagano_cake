class CartItem < ApplicationRecord
  belongs_to :item, foreign_key: "item_id"
  belongs_to :customer, foreign_key: "customer_id"
  validates :amount, presence: true
  attachment :image
end
