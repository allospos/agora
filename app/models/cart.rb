class Cart < ActiveRecord::Base
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy

  def add(item, quantity=1)
    cart_item = cart_items.where(item: item, delivery_method: item.delivery_methods.first)
    if cart_item.exists?
      cart_item = cart_item.first
      cart_item.update_attributes(quantity: cart_item.quantity+quantity)
    else
      cart_items << CartItem.create(item: item,
                                    quantity: quantity,
                                    price: item.price,
                                    delivery_method: item.delivery_methods.first)
    end
  end

  def remove(item_id, quantity=1)
    cart_item = cart_items.where(item_id: item_id).first
    if cart_item.quantity > quantity
      cart_item.update_attributes(quantity: cart_item.quantity-quantity)
      I18n.t('cart.remove_item')
    elsif cart_item.delete
      I18n.t('cart.remove_item')
    else
      I18n.t('cart.could_no_remove_item')
    end
    cart_item
  end

  def empty?
    cart_items.empty?
  end

  def item_count
    items.pluck(:quantity).map(&:to_i).inject(0, &:+)
  end

  def total
    items.inject(0){ |total, item| total += item.price.to_d*item.quantity.to_d }
  end

  def delivery_charges
  end

  private
  def items
    cart_items
  end

end
