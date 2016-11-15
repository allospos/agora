class User < ApplicationRecord
  include Clearance::User

  has_many :products

  validates :full_name, :username, presence: true
end
