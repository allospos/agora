require 'rails_helper'

RSpec.feature "Shopping basket" do
  context "a guest" do

    it "has an empty shopping basket when first visiting the website" do
      visit root_path
      click_on "Cart"
      expect(page).to have_content("There are no items in your shopping basket")
    end

    it "can add items to their shopping basket" do
      items = 3.times.map { Fabricate(:item) }
      visit item_path(items[0])
      click_on("Add to cart")

      expect(page).to have_content("#{items[0].title} has been added to your basket")
      expect(page).to have_content("There is one item in your shopping basket")
    end

  end
end
