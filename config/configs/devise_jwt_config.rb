# frozen_string_literal: true

class DeviseJwtConfig < ApplicationConfig
  attr_config :secret_key

  def secret_key
    Rails.application.credentials.send(Rails.env)[:devise_jwt_key]
  end
end
