# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountUser, type: :model do
  context 'with existing account user' do
    subject(:user) { FactoryBot.create(:user) }

    it 'can determine if it has a role' do
      aggregate_failures('Verify role is not admin') do
        expect(user.account_users.first).not_to be_role 'admin'

        user.account_users.first.roles << :admin

        expect(user.account_users.first).not_to be_role :admin
      end
    end
  end
end
