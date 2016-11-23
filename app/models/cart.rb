class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items

  def add(item, quantity=1)
    cart_items << CartItem.create(item: item,
                                  quantity: quantity,
                                  price: item.price,
                                  delivery_method: item.delivery_methods.first)
  end

  def empty?
    cart_items.empty?
  end

  def items
    cart_items
  end

end
