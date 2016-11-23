class RenameProductToItem < ActiveRecord::Migration[5.0]
  def change
    rename_table :products, :items
  end
end
