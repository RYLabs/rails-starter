# frozen_string_literal: true

class Account < ApplicationRecord
  include Pay::Billable
  extend FriendlyId

  belongs_to :user, class_name: 'User'
  has_many :account_users, dependent: :destroy
  has_many :users, through: :account_users

  before_validation :set_random_name

  friendly_id :name, use: :slugged

  def email
    user.email
  end

  protected

  def set_random_name
    self.name ||= SecureRandom.uuid
  end
end
