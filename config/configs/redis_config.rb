# frozen_string_literal: true

##
# RedisConfig
# Handles required configuration details for redis instance
# Overide default configuration values via ENV or rails credentials
class RedisConfig < ApplicationConfig
  attr_config :url, host: 'localhost', port: 6379, database: 0

  def url
    super || (self.url = "redis://#{host}:#{port}/#{database}")
  end
end
