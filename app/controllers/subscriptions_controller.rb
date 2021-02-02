# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  include StripeSubscription

  protect_from_forgery with: :null_session

  before_action :authenticate_user!
  before_action :subscription_params, only: [:create]
  before_action :user_subscribed?, only: %i[new create destroy]

  def show
    @user = current_user
    @subscription_decorator = SubscriptionDecorator.new(current_user, view_context)
  end

  def new
  end

  # rubocop:disable Metrics/AbcSize
  def create
    create_monthly_subscription(current_user, subscription_params[:card_token])

    redirect_to subscription_path
  rescue Pay::ActionRequired => e
    redirect_to pay.payment_path(e.payment.id)
  rescue Pay::Error => e
    flash[:alert] = e.message
    render :new
  end
  # rubocop:enable Metrics/AbcSize

  def destroy
    authorize :subscription, :destroy?
    current_user.individual_account.subscription.cancel

    redirect_to subscription_path, notice: 'Your subscription has been canceled.'\
                                           ' Any remaining balance can still be used until its expiry date.'
  end

  private

  def subscription_params
    params.permit(:card_token)
  end

  def user_subscribed?
    return unless current_user.individual_account.subscribed?

    flash[:notice] = 'You are already subscribed.'
    redirect_to subscription_path
  end
end 