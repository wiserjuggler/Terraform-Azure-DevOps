variable "client_secret" {
}

variable "client_id" {
}

variable "subscription_id" {
}

variable "tenant_id" {
}

variable "resource_group_name" {
  default     = "Terraform"
}

variable "resource_location" {
  default     = "eastus2"
  description = "Location of the resource group."
}
