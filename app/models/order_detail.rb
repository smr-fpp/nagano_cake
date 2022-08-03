class OrderDetail < ApplicationRecord
  belongs_to :order, foreign_key: "order_id", optional: true
  belongs_to :item, foreign_key: "item_id", optional: true
  enum making_status: {
   production_not_possible: 0,
   production_pending: 1,
   in_production: 2,
   production_complete: 3
  }
end
