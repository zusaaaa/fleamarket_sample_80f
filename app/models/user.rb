class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, uniqueness: true
  validates :nickname, :family_name_kannji, :first_name_kannji, :family_name_kana, :first_name_kana, :birthday, :postal_code, :prefecture, :city, :house_number, :phone_number, presence: true 
end
