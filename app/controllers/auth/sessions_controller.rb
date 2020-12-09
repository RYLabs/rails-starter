# frozen_string_literal: true

module Auth
  ##
  # Used for Web authentication.
  class SessionsController < Devise::SessionsController
    skip_before_action :authenticate_user!, only: %I[new create]

    before_action :configure_sign_in_params, only: [:create]

    def after_sign_in_path_for(resource)
      # super(resource)
      new_subscription_path(resource)
    end

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: %I[email password])
    end
  end
end
