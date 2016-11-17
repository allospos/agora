require 'rails_helper'

RSpec.feature "Viewing a product", wip: true do
  let(:product) { Fabricate(:product) }

  before do
    visit product_path(product)
  end

  feature "guest visiting the website" do
    scenario "can view a product listing" do
      expect(page).to have_content(product.title)
    end

    scenario "is redicted to the sign in page if they attempt to favorite an item" do
      click_on "Favourite"

      expect(page).to have_content("Please sign in to continue")
    end
  end
end
