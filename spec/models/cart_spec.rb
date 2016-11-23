require 'rails_helper'

RSpec.describe Cart, type: :model do

  it "adding an item to the cart" do
    item = Fabricate(:item)
    cart = Fabricate(:cart)
    cart.add(item)
    expect(cart.items.count).to eq(1)
  end
end
