class Item < ApplicationRecord
  belongs_to :genre, foreign_key: "genre_id"
  has_many :cart_items
  attachment :image
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  validates :is_active, inclusion: {in: [true, false]}
  
end
