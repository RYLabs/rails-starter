# frozen_string_literal: true

class CardsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authenticate_user!

  # Create a setup intent to edit card and not charge user.
  def edit
    @setup_intent = ::Stripe::SetupIntent.create
  end

  def update
    current_user.individual_account.update_card(params[:card_token])
    redirect_to subscription_path
  end
end
