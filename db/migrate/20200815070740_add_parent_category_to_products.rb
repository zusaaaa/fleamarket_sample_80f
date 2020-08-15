class AddParentCategoryToProducts < ActiveRecord::Migration[6.0]
  def change
    # add_reference :products, :category, foreign_key: true
    add_column :products, :category, :string
  end
end
