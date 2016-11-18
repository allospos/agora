class VerificationsController < ApplicationController
  def update
    verification = VerificationMethod.where(token: params[:token], name: params[:name], verified_at: nil)
    if verification.exists?
      verification.update(verified_at: DateTime.now)
      redirect_to root_path, notice: "Your email address has been verified"
    else
      redirect_to root_path, notice: "Something went wrong"
    end
  end
end
