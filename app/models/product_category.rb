class ProductCategory < ApplicationRecord
  belongs_to :ProductCategory
  belongs_to :category
end
