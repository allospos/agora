require "rails_helper"

RSpec.describe EmailVerificationMailer, type: :mailer do
  describe "verify_email_address" do
    let(:user) { Fabricate(:user) }
    let(:mail) { EmailVerificationMailer.verify_email_address(user, :token) }

    it "renders the headers" do
      expect(mail.subject).to eq("Please verify your email address")
      expect(mail.to).to eq([user.email])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Email content")
    end
  end
end
