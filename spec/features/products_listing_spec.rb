require 'rails_helper'

RSpec.feature "Listing all products" do
  let(:user) { User.create(full_name: 'Jane Doe', username: 'janed', email: 'janed@example.com', password: 'password') }

  before do
    [{ title: "Chair", description: "Queen Anne armchair", price: "100"},
     {title: "Toaster", description: "George Foreman", price: "50"}].each do |h|
      Product.create(title: h[:title], description: h[:description], price: h[:price], user: user)
    end
  end

  scenario "a guest can view all listed products" do
    visit products_path
    expect(page).to have_content("Chair")
    expect(page).to have_content("Toaster")
  end
end
