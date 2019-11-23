class ApplicationController < ActionController::API
  before_action :check_authentication
 #  #takes in a payload and returns an encoded_token
  def encode_token(payload)
    JWT.encode(payload, ENV["jwt_secret"])
  end

  def auth_header
    request.headers['Authorization']
  end

  def current_user
    if decoded_token
      user_id = decoded_token["user_id"]
      User.find(user_id)
    end
    #rescue JWT::ExpiredSignature
    #end
  end

 #takes in the token and returns the decoded user info; or errors
  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
      JWT.decode(token, ENV["jwt_secret"])[0]
      rescue JWT::DecodeError
        nil
      rescue JWT::ExpiredSignature
        render json: { error: 'Session has expired. Please log in.'}, status: 401
      end
    end
  end

  def check_authentication
    render json: { error: 'Please log in.'}, status: 401 if !logged_in?
  end

  def logged_in?
    !!current_user
  end
end
