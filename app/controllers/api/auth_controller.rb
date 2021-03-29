class Api::AuthController < ApplicationController
  before_action :user_exists, except: [:login]

  def login
    p params[:user][:username]
    user = User.find_by(username: params[:user][:username])

    if user&.authenticate(params[:user][:password])
      token = encode_token(user.id)
      render json: {
        user: {
          id: user.id,
          username: user.username
        },
        token: token
      }
    else
      render json: {massage: 'Invalid username or password'}, status: :not_found
    end
  end
end

