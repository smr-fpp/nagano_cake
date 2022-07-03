class Item < ApplicationRecord
  belongs_to :genre, optional: true
  attachment :image
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :image_id, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  validates :is_active, presence: true
  
end
