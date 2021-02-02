# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :account_users, dependent: :destroy
  has_many :accounts, through: :account_users, dependent: :destroy
  has_one :individual_account, -> { where(account_type: 'individual') }, class_name: 'Account',
                                                                         foreign_key: :user_id,
                                                                         inverse_of: :user,
                                                                         dependent: :destroy

  after_create :create_individual_account

  def create_individual_account
    account = build_individual_account(account_type: 'individual')
    account.account_users.new(user: self)
    account.save!
    account
  end
end
