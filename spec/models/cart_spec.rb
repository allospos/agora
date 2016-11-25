require 'rails_helper'

RSpec.describe Cart, type: :model, wip: true do
  let(:item) { Fabricate(:item) }
  let(:cart) { Fabricate(:cart) }

  context "addings and removing items" do
    it "adding an item" do
      cart.add(item)

      expect(cart.item_count).to eq(1)
    end

    it "can remove an item" do
      cart.add(item)

      cart.remove(item)
      expect(cart.item_count).to eq(0)
    end

    context "multiples of an item" do
      it "can be added to the cart" do
        cart.add(item, 2)

        expect(cart.item_count).to eq(2)
      end

      it "can be removed from the cart" do
        cart.add(item, 3)
        cart.remove(item.id, 2)

        expect(cart.item_count).to eq(1)
      end

      context "adding existing cart items to the cart" do
        it "updates the quantity to the existing item" do
          cart.add(item, 3)
          cart.add(item, 2)

          expect(cart.item_count).to eq(5)
          expect(cart.cart_items.count).to eq(1)
        end
      end
    end
  end

  context "calculating the total" do
    let(:item) { Fabricate(:item, price: "3.30") }
    it "adds up the value of one item" do
      cart.add(item)

      expect(cart.total).to eq(3.3)
    end

    it "can manage multiple quantities of the same product" do
      cart.add(item, 3)

      expect(cart.total).to eq(9.9)
    end
  end
end
