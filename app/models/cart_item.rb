class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
  belongs_to :delivery_method

  def increase_quantity(quantity)
    update_quantity(self.quantity+quantity)
  end

  def decrease_quantity(quantity)
    update_quantity(self.quantity-quantity)
  end

  private
  def update_quantity(quantity)
    self.update_attributes(quantity: quantity)
  end
end
