class Product < ApplicationRecord
  belongs_to :user
  has_many :user_favourites

  mount_uploaders :images, ImageUploader
end
