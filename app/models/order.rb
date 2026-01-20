class Order < ApplicationRecord
  belongs_to :restaurant
  has_many :order_items, dependent: :destroy
  
  validates :customer_name, presence: true
  validates :total_amount, presence: true, numericality: { greater_than: 0 }
  
  enum status: { pending: 0, confirmed: 1, preparing: 2, ready: 3, completed: 4 }
end
