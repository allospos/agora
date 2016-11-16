class DashboardController < ApplicationController
  layout 'landing'
  def index
    @latest_products = Product.order('created_at desc').limit(4)
  end
end
