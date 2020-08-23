class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :birthday_y_m_d ,presence: true 

  has_many :products
  has_one :address
  has_many :cards, foreign_key: true
  has_many :products, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def already_favorited?(product)
    self.favorites.exists?(product_id: product.id)
  end
end
