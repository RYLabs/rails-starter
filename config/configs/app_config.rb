# frozen_string_literal: true

# This is a generic configuration class for your app.  If you have a group of
# configs you might choose to separate them out into their own config, but for
# small sets of configs or one-offs, this is a convenient place to declare them.
class AppConfig < ApplicationConfig

  # Secret used for encrypting JWT tokens. We recommend that this be stored
  # using Rails credentials like so:
  #
  #  app:
  #    devise_jwt_secret_key: <secret key>
  attr_config :devise_jwt_secret_key
end