# frozen_string_literal: true

module Auth
  ##
  # Used for Web authentication.
  class SessionsController < Devise::SessionsController
    respond_to :html
    protect_from_forgery with: :exception

    # rubocop:disable Rails/LexicallyScopedActionFilter
    before_action :authenticate_user!, only: %I[update destroy]
    before_action :configure_sign_in_params, only: [:create]
    # rubocop:enable Rails/LexicallyScopedActionFilter

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: %I[email password])
    end
  end
end
