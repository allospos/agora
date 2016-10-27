require 'rails_helper'

RSpec.feature 'User Actions' do
  feature 'a user click Sign up' do
    before do
      visit root_path
      click_on 'Sign up'
    end

    scenario 'and cannot sign up until they have all mandatory fields filled' do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Sign up'

      within('.user_username') do
        expect(page).to have_content "can't be blank"
      end

      within('.user_full_name') do
        expect(page).to have_content "can't be blank"
      end
    end

    scenario 'and can sign up succesfuly when they complete all required fields' do
      fill_in 'Full name', with: 'Jane Doe'
      fill_in 'Username', with: 'janed'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Sign up'

      expect(page).to have_content('Signed in as: user@example.com')
    end
  end

  feature 'a user click Sign in' do
    let!(:user) { User.create(full_name: 'Jane Doe', username: 'janed', email: 'janed@example.com', password: 'password') }

    before do
      visit root_path
      click_on 'Sign in'
    end

    scenario 'and can sign up succesfuly when they complete all required fields' do
      fill_in 'Email', with: 'janed@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Sign in'

      expect(page).to have_content('Signed in as: janed@example.com')
    end
  end
end
