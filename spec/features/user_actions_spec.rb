require 'rails_helper'

RSpec.feature "Sign up" do
  before do
    visit root_path
    click_on "Sign up"
  end

  it "a user cannot sign up until they have all mandatory fields filled" do
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign up'

    within(".user_username") do
      expect(page).to have_content "can't be blank"
    end

    within(".user_full_name") do
      expect(page).to have_content "can't be blank"
    end
  end

  it "a user can sign up succesfuly when they complete all required fields" do
    fill_in 'Full name', with: 'Jane Doe'
    fill_in 'Username', with: 'janed'
    fill_in 'Email', with: 'janed@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content("Signed in as: janed@example.com")
  end
end

