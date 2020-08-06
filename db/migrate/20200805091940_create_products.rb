class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :product_explanation
      t.string :brand
      t.string :product_status
      t.string :shipping_method
      t.string :shipping_charge
      t.string :shipping_area
      t.integer :days_until_shipiing
      t.integer :price
      t.timestamps
    end
  end
end
