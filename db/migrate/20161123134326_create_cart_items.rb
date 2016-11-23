class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.references :cart, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity
      t.string :price
      t.references :delivery_method, foreign_key: true
      t.string :delivery_charge

      t.timestamps
    end
  end
end
