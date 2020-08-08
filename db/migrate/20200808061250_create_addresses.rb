class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_code,   null: false
      t.string :prefecture,     null: false
      t.string :city,           null: false
      t.integer :house_number,  null: false
      t.integer :phone_number
      t.timestamps
    end
  end
end
