# frozen_string_literal: true

module Api
  module Auth
    ##
    # JSON API new user registrations
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json
      protect_from_forgery with: :null_session

      before_action :configure_permitted_parameters
      before_action :authenticate_user!, only: %i[update destroy]

      protected

      # If you have extra params to permit, append them to the sanitizer.
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password])
      end

      def configure_account_update_params
        devise_parameter_sanitizer.permit(:account_update, keys: %i[email])
      end
    end
  end
end
