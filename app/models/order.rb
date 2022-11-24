class Order < ApplicationRecord

  validates :postal_code,          presence:true
  validates :address,              presence:true
  validates :name,                 presence:true
  validates :shoping_cost,         presence:true
  validates :total_payment,        presence:true
  validates :payment_method,       presence:true

  enum payment_method: { credit_card: 0, transfer: 1 }

end
