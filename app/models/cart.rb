class Cart < ActiveRecord::Base
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy

  def add(item, quantity=1)
    cart_item = cart_item(item.id)
    cart_item ? cart_item.increase_quantity(quantity) :
                create_cart_item(item, quantity)
  end

  def remove(item_id, quantity=1)
    cart_item = cart_item(item_id)
    cart_item.quantity > quantity ? cart_item.decrease_quantity(quantity) :
                                    cart_item.delete
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
    #items.pluck(:delivery_charge).inject(0){|total, charge| total += charge.to_d }
  end

  private
  def items
    cart_items
  end

  def create_cart_item(item, quantity)
    cart_items << CartItem.create(item: item,
                                  quantity: quantity,
                                  price: item.price,
                                  delivery_method: item.delivery_methods.first)
  end

  def cart_item(item_id)
    cart_items.where(item_id: item_id).try(:first) rescue nil
  end
end
