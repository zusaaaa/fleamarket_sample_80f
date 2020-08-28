class Category < ApplicationRecord
  has_ancestry
  has_many :products
  accepts_nested_attributes_for :products

  def set_products
    # 親カテゴリーの場合
    if self.root?
      first_id = self.indirects.first.id
      last_id = self.indirects.last.id
      products = Product.where(category_id: first_id..last_id)

    # 子カテゴリーの場合
    elsif self.has_children?
      first_id = self.children.first.id
      last_id = self.children.last.id
      products = Product.where(category_id: first_id..last_id)

    else
      return self.products
    end
  end
end
