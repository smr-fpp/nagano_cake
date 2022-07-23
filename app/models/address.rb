class Address < ApplicationRecord
  belongs_to :customer, foreign_key: "customer_id"
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  
  def view_address
    "〒" + self.postal_code + " " + self.address + " " + self.name
  end
end
