# frozen_string_literal: true

module Auth
  ##
  # Used to register a new user via Web
  class RegistrationsController < Devise::RegistrationsController
    respond_to :html
    protect_from_forgery with: :exception

    before_action :authenticate_user!, only: %I[update destroy]
    before_action :configure_sign_up_params, only: [:create]

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password])
    end
  end
end
