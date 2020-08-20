class Product < ApplicationRecord
  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :days_until_shipping
  belongs_to_active_hash :product_status
  belongs_to_active_hash :prefecture
  # has_many :product_categories, dependent: :destroy
  belongs_to :category, optional: true

  belongs_to :user, optional: true
  belongs_to :card, optional: true

  # 子モデルimagesのアソシエーション
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  # バリデーション
  validates :product_name, presence: true
  validates :product_explanation, presence: true
  validates :product_status_id, presence: true
  validates :shipping_method_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_until_shipping_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :images, presence: true
  validates :status, presence: true

  def self.search(search)
    if search
      Product.where('product_name LIKE(?)', "%#{search}%")
    else
      Product.all
    end
  end
end
