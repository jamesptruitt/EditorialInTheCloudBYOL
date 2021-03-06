#########################
# Input Variables       #
#########################
variable "hostname" {
  description = "description"
}

variable "admin_password" {
  description = "Admin Password for Virtual Machines"
}

variable "admin_username" {
  description = "Admin Username for Virtual Machines"
  default = "avid"
}

variable "nexis_storage_vm_number_public_ip" {
  description = "description"
}

variable "nexis_storage_vm_remote_port" {
  description = "description"
  default = 22
}

variable "nexis_storage_vm_instances" {
  description = "description"
  default = 1
}

variable "nexis_storage_vm_size" {
  description = "description"
}

variable "nexis_storage_type" {
    description = ""
}

variable "nexis_vm_os_simple"{   
  description = "description"                 
  default = "Debian"
}

variable "nexis_vm_os_id"{   
  description = "description"                 
  default = ""
}

variable "resource_group_name" {
  description = ""
}

variable "resource_group_location" {
  description = ""
}

variable "subnet_id" {
  description = ""
}

variable "source_address_prefix" {
  description = "CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used."
  default = "*"
}

variable "base_index" {
  description = "Base index"
  default = 0
}

variable "tags" {
  description = "description"
}

#########################
# General Variables     #
#########################
resource "random_string" "nexis" {
    length  = 5
    special = false
    upper   = false
}

#########################
# Maps                  #
#########################
variable "nexis_storage_configuration" { # nexis_storage_vm_script_url, nexis_storage_vm_script_name, nexis_storage_vm_artifacts_location, nexis_storage_vm_build, nexis_storage_vm_part_number
  default       = {
    "CloudNearline" = "Standard,LRS,StorageV2"
    "CloudOnline"   = "Premium,LRS,BlockBlobStorage"
  }
}