# frozen_string_literal: true

FactoryBot.define do
  factory :account_user do
    user
    account
  end
end
