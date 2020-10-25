redis_config = RedisConfig.new

Sidekiq.configure_server do |config|
  config.redis = { url: redis_config.url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_config.url }
end