class User < ApplicationRecord
  include Clearance::User

  after_create :verify_user_email

  has_many :products
  has_many :user_favourites
  has_many :favourite_products, through: :user_favourites, source: :product
  has_many :verification_methods

  validates :full_name, :username, presence: true
  validates :username, uniqueness: true

  def verify_user_email
    verification_method = self.verification_methods.create(name: "email")
    verification_method.generate_email_token
    EmailVerificationMailer.verify_email_address(self, verification_method.token).deliver
  end

  def verified_email?
    @verified_email ||= verified?("email")
  end

  def verified_phone?
    @verified_sms ||= verified?("sms")
  end

  private

  def verified?(name)
    self.verification_methods.where("name=? and verified_at is not null", name).exists?
  end
end
