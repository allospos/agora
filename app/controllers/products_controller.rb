class ProductsController < ApplicationController
  before_action :require_login

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to @product, notice: "Your listing for #{@product.title} is now public"
    else
      render "products/new"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end
