class IndividualAccount < BaseAccount
  has_one :user
  before_validation :set_random_name

  protected

  def set_random_name
    self.name = self.slug = SecureRandom.uuid
  end

  ##
  # Required for Pay gem intergration
  def email
    user.email
  end
end
