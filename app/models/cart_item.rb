class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer
  belongs_to :order

  validates :amount,   presence: true

  ## 小計を求めるメソッド
  def subtotal
    item.with_tax_price * amount
  end

end
