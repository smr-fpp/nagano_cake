class Item < ApplicationRecord
  belongs_to :genre, foreign_key: "genre_id"
  has_many :cart_items
  attachment :image
  
 
  validates :image, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  validates :is_active, inclusion: {in: [true, false]}
  
  def with_tax_price
      (price * 1.1).floor
  end
  
end
