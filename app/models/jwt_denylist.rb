# frozen_string_literal: true

##
# JwtDenyList
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist
end
