# Preview all emails at http://localhost:3000/rails/mailers/email_verification
class EmailVerificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/email_verification/verify_email_address
  def verify_email_address
    EmailVerificationMailer.verify_email_address
  end

end
