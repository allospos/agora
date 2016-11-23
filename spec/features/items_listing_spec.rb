require 'rails_helper'

RSpec.feature "Listing all items" do
  before do
    ["Chair", "Toaster"].each do |title|
      Fabricate(:item, title: title)
    end
  end

  scenario "a guest can view all listed items" do
    visit items_path
    expect(page).to have_content("Chair")
    expect(page).to have_content("Toaster")
  end
end
