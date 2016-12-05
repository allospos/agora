class CartsController < ApplicationController

  def show
    @cart = find_cart || Cart.new
  end

  def create
    @cart = find_cart || Cart.create
    cookies[:cart_id] = @cart.id unless current_user
    @cart.add(item)
    redirect_to cart_path, notice: "#{item.title} has been added to your basket"
  end

  def destroy
    @cart = find_cart
    if @cart
      @cart.destroy!
      cookies[:cart_id]=""
    end
    redirect_to cart_path, notice: "Your cart has been emptied"
  end

  def update
    @cart = find_cart
    item = @cart.remove(params[:item_id])
    redirect_to cart_path, notice: "#{item.item.title} has been removed from your cart"
  end

  private
  def item
    @item ||= Item.find(params[:item_id])
  end


  def find_cart
    return @cart = current_user.cart if current_user
    @cart = cookies[:cart_id].present? ? Cart.find(cookies[:cart_id]) : nil
  end
end
