module ErrorHandler
  extend ActiveSupport::Concern

  included do
  rescue_from StandardError, with: :handle_standard_error
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid
  end

  private

  def handle_standard_error(exception)
    render json: {
      status: 500,
      message: 'Internal Server Error',
      detail: exception.message
    }, status: :internal_server_error
  end

  def handle_record_not_found(exception)
    render json: {
      status: 404,
      message: 'Record Not Found',
      detail: exception.message
    }, status: :not_found
  end

  def handle_record_invalid(exception)
    render json: {
      status: 422,
      message: 'Record Invalid',
      detail: exception.message
    }, status: :unprocessable_entity
  end
end
