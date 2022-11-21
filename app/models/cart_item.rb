class CartItem < ApplicationRecord

  has_many :items

  validates :amount,   presence: true

end
