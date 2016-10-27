class User < ApplicationRecord
  include Clearance::User

  validates :full_name, :username, presence: true
end
