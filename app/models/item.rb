class Item < ApplicationRecord

    belongs_to :genre, optional: true

    has_many :cart_items

    has_one_attached :image

    validates :name,           presence:true
    validates :introduction,   presence:true
    validates :price,          presence:true
    validates :is_active,      presence:true

    ## 消費税を求めるメソッド
    def with_tax_price
        (price * 1.1).floor
    end

end
