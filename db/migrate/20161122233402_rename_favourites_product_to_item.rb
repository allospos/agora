class RenameFavouritesProductToItem < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_favourites, :product_id, :item_id
  end
end
