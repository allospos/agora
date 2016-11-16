class CreateProductDeliveryMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :product_delivery_methods do |t|
      t.references :product, foreign_key: true
      t.references :delivery_method, foreign_key: true

      t.timestamps
    end
  end
end
