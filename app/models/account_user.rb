# frozen_string_literal: true

##
# AccountUser
class AccountUser < ApplicationRecord
  belongs_to :user
  belongs_to :account

  def role?(role_name)
    roles.include?(role_name.to_s)
  end
end
