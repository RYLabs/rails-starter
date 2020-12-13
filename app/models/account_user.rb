class AccountUser < ApplicationRecord
  belongs_to :user
  belongs_to :account

  def has_role?(role_name)
    roles.include?(role_name.to_s)
  end
end
