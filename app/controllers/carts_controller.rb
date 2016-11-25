class CartsController < ApplicationController

  def show
    @cart = current_user.cart if current_user
    if @cart.nil?
      @cart = cookies[:cart_id].present? ? Cart.find(cookies[:cart_id]) : Cart.new
    end
  end

  def create
    @cart = current_user.cart if current_user
    if @cart.nil?
      @cart = cookies[:cart_id].present? ? Cart.find(cookies[:cart_id]) : Cart.create
      cookies[:cart_id] = @cart.id
    end
    @cart.add(item)
    redirect_to cart_path, notice: "#{item.title} has been added to your basket"
  end

  def destroy
    @cart = current_user.cart if current_user
    if @cart.nil? and cookies[:cart_id].present?
      @cart = Cart.find(cookies[:cart_id])
      @cart.destroy!
      cookies[:cart_id]=""
    end
    redirect_to cart_path, notice: "Your cart has been emptied"
  end

  def update
    @cart = current_user.cart if current_user
    if @cart.nil? and cookies[:cart_id].present?
      @cart = Cart.find(cookies[:cart_id])
    end
    item = @cart.remove(params[:item_id])
    redirect_to cart_path, notice: "#{item.item.title} has been removed from your cart"
  end

  private
  def item
    @item ||= Item.find(params[:item_id])
  end
end
