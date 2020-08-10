class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :image
      t.string :product_name
      t.text :product_explanation
      t.string :brand
      t.string :product_status
      t.integer :price
      t.references :user, foreign_key: true

      t.string :shipping_method
      t.integer :shipping_charge
      t.string :shipping_area
      t.integer :days_until_shipping
      
      t.timestamps
    end
  end
end