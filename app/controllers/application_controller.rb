class ApplicationController < ActionController::API
  before_action :user_exists

  def encode_token user_id
    JWT.encode user_id, nil, 'none'
  end

  def decode_token
    auth_token = request.headers['token']
    # p auth_token
    if auth_token
      begin
        decoded = JWT.decode auth_token, nil, false
        #print the decoded user id that has been encoded
        p decoded
      rescue StandardError
        p 'NIL'
        nil
      end
    end
  end

  def user_exists
    valid = decode_token
    p "valid"
    p valid
    if valid
      params[:loginUser_id] = valid[0]
      p "params currentUserId"
      p params[:loginUser_id]
      true
    else
      render json: { message: 'Unauthorised' }, status: :unauthorized
    end
  end


end
