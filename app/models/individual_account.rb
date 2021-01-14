# frozen_string_literal: true

class IndividualAccount < BaseAccount
  has_one :user, dependent: :destroy
  before_validation :set_random_name

  protected

  def set_random_name
    self.name = self.slug = SecureRandom.uuid
  end
end
