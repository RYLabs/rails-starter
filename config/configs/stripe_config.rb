# frozen_string_literal: true

class StripeConfig < ApplicationConfig
  attr_config :private_key, :public_key, :signing_key
end
