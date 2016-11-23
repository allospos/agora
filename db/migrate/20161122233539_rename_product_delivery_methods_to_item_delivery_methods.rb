class RenameProductDeliveryMethodsToItemDeliveryMethods < ActiveRecord::Migration[5.0]
  def change
    rename_table :product_delivery_methods, :item_delivery_methods
  end
end
