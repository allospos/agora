class VerificationMethod < ApplicationRecord
  belongs_to :user

  def generate_email_token
    self.token = SecureRandom.hex(20).encode('UTF-8')
    self.save
  end
end
