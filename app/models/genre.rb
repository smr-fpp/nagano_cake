class Genre < ApplicationRecord
  
  has_one :item
  validates :name, presence: true
end
