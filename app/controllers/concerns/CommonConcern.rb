module CommonConcern extend ActiveSupport::Concern
  def error(status, code, msg)
    render json: { response_type: "ERROR", response_code: code, message: msg }, status: status
  end
end
