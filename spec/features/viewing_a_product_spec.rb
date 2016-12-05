require 'rails_helper'

RSpec.feature "Viewing a item" do
  let(:item) { Fabricate(:item) }

  before do
    visit item_path(item)
  end

  feature "guest visiting the website" do
    scenario "can view a item listing" do
      expect(page).to have_content(item.title)
    end

    scenario "is redicted to the sign in page if they attempt to favorite an item" do
      click_on "Favourite"

      expect(page).to have_content("Please sign in to continue")
    end
  end
end
