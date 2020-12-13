require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has individual account when creation' do
    user = described_class.create!(email: 'test@example.com', password: 'Password123!')
    expect(user).to be_persisted
    expect(user.individual_account).to_not be_nil
  end

  context 'with existing user' do
    subject { FactoryBot.create(:user) }

    it 'has many accounts' do
      account = FactoryBot.create(:account)
      subject.account_users.create!(account: account)
      expect(subject.accounts).to include(account)
    end
  end
end
