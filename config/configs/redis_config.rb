class RedisConfig < ApplicationConfig
  attr_config :url, host: 'localhost', port: 6379, database: 0
  
  def url
    super || (self.url = "redis://#{host}:#{port}/#{database}")
  end
end