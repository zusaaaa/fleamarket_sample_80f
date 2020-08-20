class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :product_explanation
      t.references :category, foreign_key: true
      t.string :brand
      t.string :product_status_id
      t.string :shipping_method_id
      t.string :shipping_charge_id
      t.string :prefecture_id
      t.integer :days_until_shipping_id
      t.integer :price
      t.string :status
      t.timestamps
    end
  end
end