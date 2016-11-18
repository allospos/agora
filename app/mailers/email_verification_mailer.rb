class EmailVerificationMailer < ApplicationMailer

  def verify_email_address(user, token)
    @token = token
    mail(to: user.email, subject: 'Please verify your email address')
  end
end
