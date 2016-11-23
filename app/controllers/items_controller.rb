class ItemsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    @item = Item.new
  end

  def index
    @items = Item.order('created_at desc').all
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to @item, notice: "Your listing for #{@item.title} is now public"
    else
      render "items/new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:title, :description, :price, :condition, :item_type, { images: []}, delivery_method_ids: [])
  end
end
