# frozen_string_literal: true

module Auth
  ##
  # Used to register a new user via Web
  class RegistrationsController < Devise::RegistrationsController
    skip_before_action :authenticate_user!, only: %I[create, new]
    before_action :configure_sign_up_params, only: [:create]

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
    end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end

    # The path used after sign up.
    def after_sign_up_path_for(resource)
      new_subscription_path(resource)
    end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  end
end
