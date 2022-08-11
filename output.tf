output "redis_id" {
  value       = azurerm_redis_cache.cache.id
  description = "The ID of Redis instance"
}
