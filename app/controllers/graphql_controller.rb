# frozen_string_literal: true

##
# GraphqlController
class GraphqlController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authenticate_user!, only: %i[execute]

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = { current_user: current_user }
    result = ApplicationSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue GraphQL::ExecutionError => e
    raise e unless Rails.env.development?

    handle_error_in_development e
  end

  private

  # Handle variables in form data, JSON body, or a blank value
  # rubocop:disable Metrics/MethodLength
  def prepare_variables(variables_param)
    case variables_param
    when String
      return JSON.parse(variables_param) || {} if variables_param.present?

      {}
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"

    end
  end
  # rubocop:enable Metrics/MethodLength

  def handle_error_in_development(err)
    logger.error err.message
    logger.error err.backtrace.join("\n")

    render json: { errors: [{ message: err.message, backtrace: err.backtrace }], data: {} }, status: 500
  end
end
