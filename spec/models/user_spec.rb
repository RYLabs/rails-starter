# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has individual account when creation' do
    aggregate_failures('Verify user persited with individual_account') do
      user = described_class.create!(email: 'test@example.com', password: 'Password123!')
      expect(user).to be_persisted
      expect(user.individual_account.account_type).not_to be_nil
    end
  end

  context 'with existing user' do
    subject(:user) { FactoryBot.create(:user) }

    it 'has many accounts' do
      account = FactoryBot.create(:account, user_id: user.id)
      user.account_users.create!(account: account)
      expect(user.accounts).to include(account)
    end
  end
end
