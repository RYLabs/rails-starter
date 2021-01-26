# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  include StripeSubscription

  protect_from_forgery with: :null_session

  before_action :authenticate_user!
  before_action :subscription_params, only: [:create]
  before_action :user_subscribed?, only: [:new, :create, :destroy]

  def show
    @user = current_user
    @subscription_decorator = SubscriptionDecorator.new(current_user, view_context)
    authorize :subscription, :show?
  end

  def new
    authorize :subscription, :new?
  end

  def create
    authorize :subscription, :create?
    # service used to easily integrate futher payment gateways or expand subscription options 
    create_monthly_subscription(current_user, subscription_params[:card_token])

    redirect_to subscription_path(subscription)
  rescue Pay::ActionRequired => e
    redirect_to pay.payment_path(e.payment.id)
  rescue Pay::Error => e
    flash[:alert] = e.message
    render :new
  end

  def destroy
    authorize :subscription, :destroy?
    current_user.individual_account.subscription.cancel

    redirect_to subscription_path, notice: 'Your subscription has been canceled. Any remaining balance can still be used until its expiry date.'
  end

  private

  def subscription_params
    params.permit(:card_token)
  end

  def user_subscribed?
    if current_user.individual_account.subscribed?
      flash[:notice] = 'You are already subscribed.'
      redirect_to subscription_path
    end
  end
end
