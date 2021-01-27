# frozen_string_literal: true

SubscriptionPolicy = Struct.new(:user, :subscription) do
  def show?
    user.present?
  end

  def new?
    create?
  end

  def create?
    user.present? && !user.individual_account.subscribed?
  end

  def destroy?
    user.present? && !user.individual_account.subscribed?
  end
end
