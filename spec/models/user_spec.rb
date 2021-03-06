require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.create }

  context "#validations" do
    it "cannot create a user without a full name set" do
      expect(user.errors.messages[:full_name][0]).to eq("can't be blank")
    end

    it "cannot create a user without a username set" do
      expect(user.errors.messages[:username][0]).to eq("can't be blank")
    end

    it "must have a unique username" do
      Fabricate(:user, username: "janed")
      user = Fabricate.build(:user, username: "janed")
      user.save

      expect(user.errors.messages[:username][0]).to eq("has already been taken")
    end
  end

  context "Verification methods" do
    it "a user receives a verification request email after signing up" do
      user = Fabricate.build(:user)
      expect(user).to receive(:verify_user_email)

      user.save
    end
  end
end
