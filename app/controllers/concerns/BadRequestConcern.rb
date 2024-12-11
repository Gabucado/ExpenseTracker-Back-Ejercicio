module BadRequestConcern extend CommonConcern
  included do
    rescue_from ActiveRecord::RecordNotFound, ActionController::ParameterMissing do |e|
      error(400, 400, e.message)
    end
  end
end
