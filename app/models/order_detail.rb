class OrderDetail < ApplicationRecord
  belongs_to :order, foreign_key: "order_id", optional: true
  belongs_to :item, foreign_key: "item_id", optional: true
   enum making_status: {
    製作不可: 0,
    製作待ち: 1,
    製作中: 2,
    製作完了: 3
  }
end
