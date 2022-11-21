class Item < ApplicationRecord

    belongs_to :genre, optional: true
    belongs_to :cart_item
    has_one_attached :image


    validates :name,           presence: true
    validates :introduction,   presence: true
    validates :price,          presence: true

end
