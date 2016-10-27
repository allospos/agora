class UsersController < Clearance::UsersController
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
