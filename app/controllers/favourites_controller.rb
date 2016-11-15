 class FavouritesController < ApplicationController
   before_action :require_login, only: [:create]

   def create
     item = Product.find(params[:product_id])
     current_user.favourite_products << item
     redirect_to :back, notice: "Item #{item.title} has been added to your favourites"
   end
 end

