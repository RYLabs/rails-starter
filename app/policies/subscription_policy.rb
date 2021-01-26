class SubscriptionPolicy < Struct.new(:user, :subscription)

  def show?
    user.present?
  end

  def new?
    create?
  end

  def create?
    user.present? and not user.individual_account.subscribed?
  end

  def destroy?
    user.present? and not user.individual_account.subscribed?
  end
end
