require 'rails_helper'

RSpec.feature "Listing a new item" do
  let!(:delivery_method) { Fabricate(:delivery_method) }

  before do
    visit root_path
  end

  feature "guest visiting the website" do
    scenario "cannot access the new item page from the landing page" do
      visit new_item_path

      expect(page).to have_content("Please sign in to continue.")
    end
  end

  feature "a signed-in customer" do

    let!(:user) { Fabricate(:user) }

    scenario "can list a item" do
      sign_in(user)

      visit new_item_path

      fill_in "Title", with: "Sofa"
      fill_in "Description", with: "three-seater yellow couch"
      fill_in "Price", with: "80"
      select "New", from: "Condition"
      check delivery_method.name

      click_on "Create"

      expect(page).to have_content("Your listing for Sofa is now public")

      expect(page).to have_content("Sofa")
      expect(page).to have_content("three-seater yellow couch")
      expect(page).to have_content("€80")
    end
  end
end
