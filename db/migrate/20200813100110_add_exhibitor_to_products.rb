class AddExhibitorToProducts < ActiveRecord::Migration[6.0]
  def change
    #add_reference :products, :exhibitor, :reference, foreign_key: true
    add_reference :products, :user, foregin_key: true
  end
end
