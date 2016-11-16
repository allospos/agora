class Product < ApplicationRecord
  belongs_to :user
  has_many :user_favourites

  mount_uploaders :images, ImageUploader

  def shortened_title
    title.length > 60 ? "#{title[0...54]}..." : title
  end
end
