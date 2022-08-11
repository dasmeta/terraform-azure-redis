resource "azurerm_redis_cache" "cache" {
  capacity                      = var.capacity
  family                        = var.family
  location                      = var.location
  resource_group_name           = var.resource_group_name
  name                          = var.redis_cache_name
  public_network_access_enabled = var.public_network_access_enabled
  redis_version                 = "6"
  sku_name                      = var.sku_name

  redis_configuration {
    aof_backup_enabled    = var.redis_configuration.aof_backup_enabled
    enable_authentication = var.redis_configuration.enable_authentication
    rdb_backup_enabled    = var.redis_configuration.rdb_backup_enabled
  }
}

resource "azurerm_private_endpoint" "private_endp" {
  location            = var.location
  name                = var.private_endpoint_name
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [azurerm_private_dns_zone.dns_zone.id]
  }

  private_service_connection {
    is_manual_connection           = false
    name                           = var.private_endpoint_name
    private_connection_resource_id = azurerm_redis_cache.cache.id
    subresource_names = [
      "redisCache",
    ]
  }
}

resource "azurerm_private_dns_zone" "dns_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_a_record" "dns_a_record" {
  name                = var.record_name
  records             = var.records
  resource_group_name = var.resource_group_name

  ttl       = var.ttl
  zone_name = var.private_dns_zone_name
  depends_on = [
    azurerm_private_dns_zone.dns_zone,
  ]
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet_link" {
  name                  = var.vnet_link_name
  private_dns_zone_name = var.private_dns_zone_name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = var.vnet_id
  depends_on = [
    azurerm_private_dns_zone.dns_zone,
  ]
}

resource "azurerm_network_interface" "nic" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = var.nic_name

  ip_configuration {
    name                          = var.ip_config_name
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet_id
  }
}
