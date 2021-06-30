class Reservation < ApplicationRecord

  validates :start_at, {presence: true}
  validates :finish_at, {presence: true}
  validates :total_price, {presence: true}
  
  belongs_to :user
  belongs_to :room
end
