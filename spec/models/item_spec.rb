require 'rails_helper'

RSpec.describe Item, type: :model do
  context "#validations" do

    it "must have a title set" do
      item = Fabricate.build(:item, title: nil)
      item.save

      expect(item.errors.messages).to include(:title)
    end

    it "must have a description set" do
      item = Fabricate.build(:item, description: nil)
      item.save

      expect(item.errors.messages).to include(:description)
    end

    it "must have a price set" do
      item = Fabricate.build(:item, price: nil)
      item.save

      expect(item.errors.messages).to include(:price)
    end

    it "must have at least one delivery method set" do
      item = Fabricate.build(:item, delivery_methods: [])
      item.save

      expect(item.errors.messages).to include(:delivery_methods)
    end

    it "must have the condition set" do
      item = Fabricate.build(:item, condition: nil)
      item.save

      expect(item.errors.messages).to include(:condition)
    end

  end
end
