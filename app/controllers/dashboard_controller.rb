class DashboardController < ApplicationController
  layout 'landing'
  def index
    @latest_items = Item.order('created_at desc').limit(5)
  end
end
