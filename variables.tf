variable "location" {
  type        = string
  description = "The location of the resource group."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the Subnet"
}

variable "private_dns_zone_name" {
  type        = string
  description = "The name of the Private DNS Zone."
}

variable "public_network_access_enabled" {
  type        = bool
  default     = false
  description = "Whether or not public network access is allowed for this Redis Cache."
}

variable "vnet_id" {
  type        = string
  description = "The ID of the Virtual Network that should be linked to the DNS Zone."
}

variable "ip_config_name" {
  type        = string
  description = "A name used for this IP Configuration."
}

variable "record_name" {
  type        = string
  default     = "test-a-record"
  description = "The name of the DNS A Record."
}

variable "records" {
  type        = list(string)
  description = "List of IPv4 Addresses."
}

variable "capacity" {
  type        = number
  default     = 0
  description = " The size of the Redis cache to deploy."
}

variable "family" {
  type        = string
  default     = "C"
  description = "The SKU family/pricing group to use."
}

variable "redis_cache_name" {
  type        = string
  default     = "redis-server"
  description = "The name of the Redis instance. "
}

variable "private_endpoint_name" {
  type        = string
  default     = "test-endp"
  description = "Specifies the Name of the Private Endpoint."
}

variable "sku_name" {
  type        = string
  default     = "Basic"
  description = "The SKU of Redis to use. "
}

variable "ttl" {
  type        = number
  default     = 10
  description = "The Time To Live (TTL) of the DNS record in seconds."
}

variable "vnet_link_name" {
  type        = string
  default     = "test-vnet-link"
  description = "The name of the Private DNS Zone Virtual Network Link."
}

variable "nic_name" {
  type        = string
  default     = "test-endp-nic"
  description = "The name of the Network Interface."
}

variable "redis_configuration" {
  type = map(bool)
  default = {
    aof_backup_enabled    = false
    enable_authentication = true
    rdb_backup_enabled    = false
  }
  description = "aluaof_backup_enabled - Enable or disable AOF persistence for this Redis Cache. enable_authentication - If set to false, the Redis instance will be accessible without authentication. rdb_backup_enabled - Is Backup Enabled?"
}
