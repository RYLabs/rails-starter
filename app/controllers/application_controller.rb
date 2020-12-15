class ApplicationController < ActionController::Base
  set_current_tenant_through_filter
  include Pundit

  before_action :find_current_tenant

  private

  def find_current_tenant
    set_current_tenant(current_user.account) if current_user
    set_current_tenant(nil) unless current_user
  end
end
