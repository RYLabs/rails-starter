# frozen_string_literal: true

module Api
  module Auth
    ##
    # JSON API new user registrations
    class RegistrationsController < Devise::RegistrationsController
      before_action :configure_permitted_parameters
      skip_before_action :authenticate_user!

      protected

      # If you have extra params to permit, append them to the sanitizer.
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password])
      end

      def configure_account_update_params
        devise_parameter_sanitizer.permit(:account_update, keys: [:email])
      end
    end
  end
end
