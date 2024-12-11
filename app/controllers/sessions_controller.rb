class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = JsonWebToken.encode({ user_id: user.id })
      render json: { token: token, user: user }, status: :created
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end


  def refresh
    header = request.headers["Authorization"]
    token = header.split(" ").last if header
    decoded = JsonWebToken.decode(token)
    if decoded
      new_token = JsonWebToken.encode({ user_id: decoded[:user_id] })
      render json: { token: new_token }, status: :ok
    else
      render json: { error: "Invalid token" }, status: :unauthorized
    end
  end
end
