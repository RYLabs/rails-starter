class BaseAccount < ApplicationRecord
  self.table_name = 'accounts'

  extend FriendlyId

  friendly_id :name, use: :slugged

  validates :name, :slug, presence: true
end
