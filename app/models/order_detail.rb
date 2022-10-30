class OrderDetail < ApplicationRecord

  validates :final_price,      presence:true
  validates :amount,     presence:true

end
