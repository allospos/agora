class ProductDeliveryMethod < ApplicationRecord
  belongs_to :product
  belongs_to :delivery_method
end
