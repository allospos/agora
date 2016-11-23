class ItemDeliveryMethodProductToItem < ActiveRecord::Migration[5.0]
  def change
    rename_column :item_delivery_methods, :product_id, :item_id
  end
end
