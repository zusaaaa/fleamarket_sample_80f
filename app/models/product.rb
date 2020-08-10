class Product < ApplicationRecord
  # mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates :product_name, presence: true
  validates :product_explanation, presence: true
  validates :brand, presence: true
  validates :product_status, presence: true
  validates :shipping_method, presence: true
  validates :shipping_charge, presence: true
  validates :shipping_area, presence: true
  validates :days_until_shipping, presence: true
  validates :price, presence: true

  belongs_to :user
  has_many :comments
  has_many :images
  has_many :favorite_product
  has_many :product_category
end


