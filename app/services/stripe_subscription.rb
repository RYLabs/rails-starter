# frozen_string_literal: true

module StripeSubscription
  def create_subscription(current_user, card_token)
    ensure_user_stripe_account(current_user)
    current_user.individual_account.card_token = card_token
    current_user.individual_account.subscribe(name: 'default', plan: 'price_1I99wlIvmPrtU2SFRDGJ1ng3')
  end

  private

  def ensure_user_stripe_account(current_user)
    return if current_user.individual_account.processor

    current_user.individual_account.processor = 'stripe'
    current_user.save!
    raise current_user
    current_user.individual_account.customer
  end
end