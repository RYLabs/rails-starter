# frozen_string_literal: true

class SubscriptionDecorator
  attr_reader :user, :view_context

  def initialize(user, view_context)
    @user = user
    @view_context = view_context
  end

  def subscribed?
    @user.individual_account.subscribed?
  end

  def subscription_details
    "#{@user.individual_account.subscription.name} plan."
  end

  def subscription_expires
    "Ends: #{ends_at_format}"
  end

  def card_details
    "#{@user.individual_account.card_type} | Last four digits: #{@user.individual_account.card_last4}"
  end

  def card_expires
    "Expiry #{@user.individual_account.card_exp_month}/#{@user.individual_account.card_exp_year}"
  end

  private

  def ends_at_format(format = '%a %d %B %Y')
    @user.individual_account.subscription.ends_at.strftime(format)
  end
end
