# frozen_string_literal: true

##
# Response. Dry up the return of json response
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
