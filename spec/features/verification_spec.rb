require 'rails_helper'

RSpec.feature 'User Verification' do
  let!(:user) { Fabricate(:user) }

  feature 'a user must verify their email address on signup' do
    before do
      visit verify_path("email", user.verification_methods.first.token)
    end

    scenario 'by visiting the verification link' do
      expect(page).to have_content("Your email address has been verified")
    end

    scenario 'only once' do
      visit verify_path("email", user.verification_methods.first.token) # 2nd visit
      expect(page).to have_content("Something went wrong")
    end
  end

  feature 'a user can verify their phone number' do
    before do
      sign_in(user)
      visit profile_path
    end

    scenario "but must set their phone number first" do
      expect(page).to have_content("Set your phone number to enable sms verification")
    end

    context "when their phone number is set" do
      let(:user) { Fabricate(:user, phone: "+447788223322") }

      scenario 'by requesting a verification message' do

        expect { click_on "Verify Mobile" }.to raise_error("Account SID and auth token are required")
      end
    end
  end
end
