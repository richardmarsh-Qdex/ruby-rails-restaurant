class Reservation < ApplicationRecord
  belongs_to :restaurant
  
  validates :customer_name, presence: true
  validates :customer_email, presence: true
  validates :reservation_date, presence: true
  validates :party_size, presence: true, numericality: { greater_than: 0 }
  
  enum status: { pending: 0, confirmed: 1, cancelled: 2 }
end
