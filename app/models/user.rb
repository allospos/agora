class User < ApplicationRecord
  include Clearance::User

  has_many :products
  has_many :user_favourites
  has_many :favourite_products, through: :user_favourites, source: :product

  validates :full_name, :username, presence: true
  validates :username, uniqueness: true
end
