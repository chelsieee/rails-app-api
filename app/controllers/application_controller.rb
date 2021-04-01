class ApplicationController < ActionController::API
  before_action :user_exists

  def encode_token user_id
    JWT.encode user_id, nil, 'none'
  end

  def decode_token
    auth_token = request.headers['token']
    if auth_token
      begin
        decoded = JWT.decode auth_token, nil, false
      rescue StandardError
        p 'NIL'
        nil
      end
    end
  end

  def user_exists
    valid = decode_token
    if valid
      params[:loginUser_id] = valid[0]
      p "----currentUserId-----"
      p params[:loginUser_id]
      true
    else
      render json: { message: 'Unauthorised' }, status: :unauthorized
    end
  end


end



