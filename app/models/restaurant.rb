class Restaurant < ApplicationRecord
  has_many :menus, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :reservations, dependent: :destroy
  
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end
