require "jwt"

class ApplicationController < ActionController::API
  attr_reader :current_user
  include AuthTokenConcern
  include BadRequestConcern

  private
  def authorize_request
    check_auth_token
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decoded = JsonWebToken.decode(header)
    @current_user = User.find(decoded[:user_id]) if decoded
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render json: { error: "Unauthorized" }, status: :unauthorized
  end
end
