class ApplicationController < ActionController::Base
  set_current_tenant_through_filter
  include Pundit
end
