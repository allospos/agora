require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.new }

  before do
    user.save
  end

  it "cannot create a user without a full name set" do
    expect(user.errors.messages[:full_name][0]).to eq("can't be blank")
  end

  it "cannot create a user without a username set" do
    expect(user.errors.messages[:username][0]).to eq("can't be blank")
  end
end
