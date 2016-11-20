class VerificationMethod < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: { scope: :name}

  def generate_email_token
    self.token = SecureRandom.hex(20).encode('UTF-8')
    self.name = "email"
    self.save
  end

  def generate_sms_token
    self.token = SecureRandom.random_number(12345...99999)
    self.name = "sms"
    self.save
  end

  def to_param
    :token
  end
end
