# frozen_string_literal: true

class Account < BaseAccount
  has_many :account_users, dependent: :destroy
end
