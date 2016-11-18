require 'rails_helper'

RSpec.feature 'User Verification' do
  feature 'a user can verify their email address' do
    let!(:user) { Fabricate(:user) }

    before do
      visit verify_path("email", user.verification_methods.first.token)
    end

    scenario 'by visiting the verification link' do
      expect(page).to have_content "Your email address has been verified"
    end

    scenario 'only once' do
      visit verify_path("email", user.verification_methods.first.token) # 2nd visit
      expect(page).to have_content "Something went wrong"
    end
  end
end
