require 'rails_helper'

RSpec.describe Product, type: :model do
  context "#validations" do
    let(:product) { Fabricate.build(:product, delivery_methods: []) }

    it "must have at least one delivery method set" do
      product = Fabricate.build(:product, delivery_methods: [])
      product.save

      expect(product).to_not be_valid
      expect(product.errors.messages).to include(:delivery_methods)
    end

    it "must have the condition set" do
      product = Fabricate.build(:product, condition: nil)
      product.save

      expect(product).to_not be_valid
      expect(product.errors.messages).to include(:condition)
    end

  end
end
