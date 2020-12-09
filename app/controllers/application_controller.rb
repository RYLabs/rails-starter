# frozen_string_literal: true

##
# ApplicationController.
class ApplicationController < ActionController::Base
  include Pundit
  include CommonResponses

  protect_from_forgery with: :null_session
  respond_to :html, :json

  before_action :authenticate_user!
end
