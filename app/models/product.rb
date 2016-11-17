class Product < ApplicationRecord
  belongs_to :user
  has_many :user_favourites
  has_many :product_delivery_methods
  has_many :delivery_methods, through: :product_delivery_methods, source: :delivery_method

  validates :condition, :title, :description, :price, :user, presence:  true
  validate :delivery_method_count_validation

  mount_uploaders :images, ImageUploader

  def shortened_title
    title.length > 60 ? "#{title[0...54]}..." : title
  end

  private

  def delivery_method_count_validation
    if delivery_methods.length < 1
      errors.add(:delivery_methods, "You have to select at least one delivery method")
    end
  end
end
