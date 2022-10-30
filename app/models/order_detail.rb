class OrderDetail < ApplicationRecord

  validates :price,      presence:true
  validates :amount,     presence:true

end
