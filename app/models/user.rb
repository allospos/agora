class User < ApplicationRecord
  include Clearance::User

  after_create :verify_user_email

  has_many :products
  has_many :user_favourites
  has_many :favourite_products, through: :user_favourites, source: :product

  validates :full_name, :username, presence: true
  validates :username, uniqueness: true

  def verify_user_email
    EmailVerificationMailer.verify_email_address(self).deliver
  end
end
