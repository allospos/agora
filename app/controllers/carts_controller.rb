class CartsController < ApplicationController
  def show
    @cart = Cart.new
  end

  def create
    @cart = Cart.new
    @cart.add(item)
    flash['notice'] = "#{item.title} has been added to your basket"
    render 'show'
  end

  private
  def item
    @item ||= Item.find(params[:item_id])
  end
end
