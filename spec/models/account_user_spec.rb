# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountUser, type: :model do
  context 'with existing account user' do
    subject(:user) { FactoryBot.create(:account_user) }

    it 'can determine if it has a role' do
      aggregate_failures('Verify role is not admin') do
        expect(user).not_to be_role 'admin'

        user.roles << :admin

        expect(user).not_to be_role :admin
      end
    end
  end
end
