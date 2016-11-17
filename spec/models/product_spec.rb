require 'rails_helper'

RSpec.describe Product, type: :model do
  context "#validations" do

    it "must have a title set" do
      product = Fabricate.build(:product, title: nil)
      product.save

      expect(product.errors.messages).to include(:title)
    end

    it "must have a description set" do
      product = Fabricate.build(:product, description: nil)
      product.save

      expect(product.errors.messages).to include(:description)
    end

    it "must have a price set" do
      product = Fabricate.build(:product, price: nil)
      product.save

      expect(product.errors.messages).to include(:price)
    end

    it "must have at least one delivery method set" do
      product = Fabricate.build(:product, delivery_methods: [])
      product.save

      expect(product.errors.messages).to include(:delivery_methods)
    end

    it "must have the condition set" do
      product = Fabricate.build(:product, condition: nil)
      product.save

      expect(product.errors.messages).to include(:condition)
    end

  end
end
