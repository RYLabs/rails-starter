# frozen_string_literal: true

module CommonResponses
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
