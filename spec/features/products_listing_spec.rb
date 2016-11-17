require 'rails_helper'

RSpec.feature "Listing all products" do
  before do
    ["Chair", "Toaster"].each do |title|
      Fabricate(:product, title: title)
    end
  end

  scenario "a guest can view all listed products" do
    visit products_path
    expect(page).to have_content("Chair")
    expect(page).to have_content("Toaster")
  end
end
