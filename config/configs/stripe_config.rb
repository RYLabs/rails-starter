# frozen_string_literal: true

class StripeConfig < ApplicationConfig
  # Secret used for Stripe payments. We recommend that this be stored
  # using Rails credentials like so:
  #
  #  stripe:
  #    private_key: <private key>
  #    public_key: <public key>
  #    signing_secret: <signing secret>
  attr_config :private_key, :public_key, :signing_secret

  on_load do
    raise_validation_error("Stripe private_key cannot be blank") if private_key.blank?
    raise_validation_error("Stripe public_key cannot be blank") if public_key.blank?
    raise_validation_error("Stripe signing_secret cannot be blank") if signing_secret.blank?
  end
end