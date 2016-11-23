class ItemDeliveryMethod < ApplicationRecord
  belongs_to :item
  belongs_to :delivery_method
end
