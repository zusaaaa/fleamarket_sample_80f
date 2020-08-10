class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :family_name_kannji, :string, null: false
    add_column :users, :first_name_kannji, :string, null: false
    add_column :users, :family_name_kana, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :birthday, :date, null: false
  end
end