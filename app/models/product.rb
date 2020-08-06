class Product < ApplicationRecord

  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :product_name, presence: true
  validates :product_explanation, presence: true
  validates :product_status, presence: true
  validates :shipping_method, presence: true
  validates :shipping_charge, presence: true
  validates :shipping_area, presence: true
  validates :days_until_shipiing, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :images, presence: true


end
