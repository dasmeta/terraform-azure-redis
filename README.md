This module creates Redis Cache in Microsoft Azure. It enables connecting to the Redis instance with Private Endpoint.

## Usage
```
resource "azurerm_resource_group" "redis_rg" {
  name     = "redis_tf_rg"
  location = "North Europe"
}

module "redis" {
  source = ".../redis"

  location              = azurerm_resource_group.redis_rg.location
  resource_group_name   = azurerm_resource_group.redis_rg.name
  record_name           = "test-record"
  records               = ["11.0.1.5"]
  private_dns_zone_name = "test.redis.cache.windows.net"
  vnet_link_name        = "test-link"
  private_endpoint_name = "test-endp-1"
  nic_name              = "test-endp-1-nic"
  redis_cache_name      = "test-redis-server"
  subnet_id             = module.network.vnet_subnets[0]
  vnet_id               = module.network.vnet_id
  ip_config_name        = "test-config.sddsd-1bb-b40f-c3fd74fc3e5f"
}
```