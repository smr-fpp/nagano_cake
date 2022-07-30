class CartItem < ApplicationRecord
  belongs_to :item, foreign_key: "item_id", optional: true
  belongs_to :customer, foreign_key: "customer_id", optional: true
  validates :amount, presence: true
  
def subtotal
    item.with_tax_price * amount
end



end
