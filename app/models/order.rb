class Order < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  has_many :cart_items
  has_many :order_details

  validates :postal_code,          presence:true
  validates :address,              presence:true
  validates :name,                 presence:true
  validates :shoping_cost,         presence:true
  validates :total_payment,        presence:true
  validates :payment_method,       presence:true

  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }

end
