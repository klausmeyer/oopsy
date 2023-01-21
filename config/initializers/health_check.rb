HealthCheck.setup do |config|
  config.uri             = "health"
  config.standard_checks = []
  config.full_checks     = ["database", "migrations", "redis"]
  config.redis_password  = nil
end
