# frozen_string_literal: true

module Api
  module Auth
    class SessionsController < Devise::SessionsController
      respond_to :json
      protect_from_forgery with: :null_session

      before_action :configure_permitted_parameters
      before_action :authenticate_user!, only: [:logout]

      def create
        resource = User.find_for_database_authentication(email: params[:user][:email])
        return invalid_login_attempt unless resource

        if resource.valid_password?(params[:user][:password])
          sign_in('user', resource)
          json_response(resource)
          return
        end
        invalid_login_attempt
      end

      def logout
        return json_response({ message: 'User logged out.' }) if current_user.reset_authentication_token!
      end

      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
      end

      def invalid_login_attempt
        warden.custom_failure!
        json_response({ err: { message: 'Error invalid credentials' } }, :unauthorized)
      end
    end
  end
end
