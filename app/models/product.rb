class Product < ApplicationRecord
  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :days_until_shipping
  belongs_to_active_hash :product_status
  belongs_to_active_hash :prefecture

  # 子モデルimagesのアソシエーション
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  # バリデーション
  validates :product_name, presence: true
  validates :product_explanation, presence: true
  validates :product_status, presence: true
  validates :shipping_method, presence: true
  validates :shipping_charge, presence: true
  validates :prefecture, presence: true
  validates :days_until_shipping, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :images, presence: true

end
