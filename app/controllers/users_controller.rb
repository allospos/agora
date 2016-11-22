class UsersController < Clearance::UsersController
  before_action :require_login, only: [:profile]

  def show
    @user = User.find(params[:id])
  end

  def profile
  end

  def update_phone
    phone = params[:user][:phone]
    current_user.update_attribute(:phone, phone)
    redirect_to :back, notice: "Your phone number has been set"
  end

  private

  def user_from_params
    full_name = user_params.delete(:full_name)
    username = user_params.delete(:username)
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.full_name = full_name
      user.username = username
      user.email = email
      user.password = password
    end
  end

end
