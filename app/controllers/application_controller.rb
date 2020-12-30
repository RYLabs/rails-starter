# frozen_string_literal: true

##
# ApplicationController.
class ApplicationController < ActionController::Base
  set_current_tenant_through_filter
  include Pundit
  include CommonResponses
end
