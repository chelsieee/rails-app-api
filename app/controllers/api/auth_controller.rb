class Api::AuthController < ApplicationController
  before_action :user_exists, except: [:login]

  def login
    p params[:username]
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      token = encode_token(user.id)

      render json: {
        user: {
          id: user.id,
          username: user.username
        },
        token: token
      }
    else
      render json: { message: 'Invalid username or password' }, status: :not_found
    end
  end
end

