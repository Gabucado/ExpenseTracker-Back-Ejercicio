module AuthTokenConcern extend ActiveSupport::Concern
  include CommonConcern
  class AuthorizationIsNilError < StandardError
    def initialize(msg = "The authorization token is nil")
      super(msg)
    end
  end

  included do
    rescue_from AuthorizationIsNilError do |e|
      handle_authorization_error(e)
    end
  end

  def check_auth_token
    if request.headers["Authorization"].nil?
      raise AuthTokenConcern::AuthorizationIsNilError
    end
  end

  private

  def handle_authorization_error(e)
    error(401, 401, e.message)
  end
end
