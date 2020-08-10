class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :family_name_kanji, :string, null: false
    add_column :users, :first_name_kanji, :string, null: false
    add_column :users, :family_name_kana, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :birthday_y_m_d, :date, null: false
  end
end
