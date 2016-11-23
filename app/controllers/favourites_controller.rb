 class FavouritesController < ApplicationController
   before_action :require_login, only: [:create]

   def create
     item = Item.find(params[:item_id])
     current_user.favourite_items << item
     redirect_to :back, notice: "Item #{item.title} has been added to your favourites"
   end
 end

