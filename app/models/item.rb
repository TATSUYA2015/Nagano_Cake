class Item < ApplicationRecord

    belongs_to :genre, optional: true
    belongs_to :order_detail
    has_many :cart_items
    has_many :order

    has_one_attached :image


    validates :name,           presence: true
    validates :introduction,   presence: true
    validates :price,          presence: true

    ## 消費税を求めるメソッド
    def with_tax_price
        (price * 1.1).floor
    end

end
