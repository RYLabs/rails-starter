# frozen_string_literal: true

##
# SubscriptionsController
# Handles Account subscription
class SubscriptionsController < ApplicationController
  include StripeSubscription
  
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :subscription_params, only: [:create]

  def show
    @current_user = current_user
  end

  def new
    if current_user.individual_account.subscribed?
      flash[:notice] = 'You are already subscribed.'
      redirect_to subscription_path
    end
  end

  def create
    return redirect_to subscription_path, notice: 'You are already subscribed.' if current_user.individual_account.subscribed?
    puts "WHAT IS THE PLAN :: ", subscription_params[:plan]
    create_subscription(current_user, subscription_params[:card_token])
    flash[:notice] = 'Thank you, You are now subscribed!'
    redirect_to subscription_path
  rescue Pay::ActionRequired => e
    redirect_to pay.payment_path(e.payment.id)
  rescue Pay::Error, Stripe::InvalidRequestError => e
    flash[:alert] = e.message
    render :new
  end

  def destroy
    current_user.individual_account.subscription.cancel

    redirect_to subscription_path, notice: 'Your subscription to Vantage has been canceled. Any remaining balance can still be used until its expiry date.'
  end

  private

  def subscription_params
    params.permit(:card_token, :authenticity_token, :name_on_card, :plan)
  end
end
