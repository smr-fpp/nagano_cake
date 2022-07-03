class Genre < ApplicationRecord
  belongs_to :admin, optional: true
  
  validates :name, presence: true
end
