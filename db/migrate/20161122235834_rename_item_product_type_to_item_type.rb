class RenameItemProductTypeToItemType < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :product_type, :item_type
  end
end
