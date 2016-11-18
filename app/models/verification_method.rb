class VerificationMethod < ApplicationRecord
  belongs_to :user

  def generate_email_token
    self.token = SecureRandom.hex(20).encode('UTF-8')
    self.name = "email"
    self.save
  end

  def to_param
    :token
  end
end
