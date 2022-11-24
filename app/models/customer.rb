class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def activ_for_authentication?
    super && (self.is_deleted == false)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items

  validates :last_name,            presence: true
  validates :first_name,           presence: true
  validates :last_name_kana,       presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :first_name_kana,      presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :postal_code,          presence: true
  validates :address,              presence: true
  validates :telephone_number,     presence: true
end
