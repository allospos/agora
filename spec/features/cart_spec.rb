require 'rails_helper'

RSpec.feature "Shopping basket" do
  context "a guest" do

    it "has an empty shopping basket when first visiting the website" do
      visit root_path
      click_on "Cart"
      expect(page).to have_content("There are no items in your shopping basket")
    end

    it "can add an item to their shopping basket" do
      item = Fabricate(:item) 
      visit item_path(item)
      click_on("Add to cart")

      expect(page).to have_content("#{item.title} has been added to your basket")
      expect(page).to have_content("There are 1 items in your shopping basket")
    end

    it "can add multiple items to their shopping basket" do
      items = 3.times.map { Fabricate(:item) }
      visit item_path(items[0])
      click_on("Add to cart")

      visit item_path(items[1])
      click_on("Add to cart")

      expect(page).to have_content("#{items[1].title} has been added to your basket")
      expect(page).to have_content("There are 2 items in your shopping basket")
    end

    it "can clear a shopping cart" do
      item = Fabricate(:item) 
      visit item_path(item)
      click_on("Add to cart")

      expect(page).to have_content("#{item.title} has been added to your basket")
      expect(page).to have_content("There are 1 items in your shopping basket")
      click_on("Clear")
      expect(page).to have_content("There are no items in your shopping basket")
    end
  end

  it "can remove an item from the cart" do
      item = Fabricate(:item) 
      visit item_path(item)
      click_on("Add to cart")

      find(".remove").click
      expect(page).to have_content("There are no items in your shopping basket")
  end
end
