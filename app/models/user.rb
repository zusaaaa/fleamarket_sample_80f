class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  validates :nickname, :password, :email, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :birthday, :postal_code, :prefecture, :city, :house_number, :phone_number
end
