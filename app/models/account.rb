# frozen_string_literal: true

class Account < BaseAccount
  include Pay::Billable
  has_many :account_users, dependent: :destroy
end
