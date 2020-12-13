require 'rails_helper'

RSpec.describe AccountUser, type: :model do
  context 'with existing account user' do
    subject { FactoryBot.create(:account_user) }

    it 'can determine if it has a role' do
      expect(subject).to_not be_has_role 'admin'

      subject.roles << :admin

      expect(subject).to_not be_has_role :admin
    end
  end
end
