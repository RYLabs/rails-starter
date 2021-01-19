# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_one :individual_account, dependent: :destroy
  has_many :account_users, dependent: :destroy
  has_many :accounts, through: :account_users

  after_create :create_individual_account!
end
