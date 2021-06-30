class Room < ApplicationRecord

  validates :name, {presence: true}
  validates :price, {presence: true}
  validates :address, {presence: true}
  
 include JpPrefecture
 jp_prefecture :prefecture_eq 

 belongs_to :user
 has_many :reservations

end
