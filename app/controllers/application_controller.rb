class ApplicationController < ActionController::API
  include ActionController::Cookies
  
  before_action :authenticate_request

  private

  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    if token
      decoded = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      @current_user = User.find(decoded['user_id'])
    else
      render json: { error: 'Not authenticated' }, status: :unauthorized
    end
  rescue JWT::DecodeError
    render json: { error: 'Invalid token' }, status: :unauthorized
  end

  def current_user
    @current_user
  end
end
