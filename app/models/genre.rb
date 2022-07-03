class Genre < ApplicationRecord
  belongs_to :admin, optional: true
  belongs_to :item, optional: true
  validates :name, presence: true
end
