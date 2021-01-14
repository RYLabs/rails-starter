# frozen_string_literal: true

class ApplicationController < ActionController::Base
  set_current_tenant_through_filter
  include Pundit
  include CommonResponses
end
