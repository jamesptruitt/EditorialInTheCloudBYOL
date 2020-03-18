#########################
# Input Variables       #
#########################
variable "hostname" {
  description = "description"
}

variable "admin_password" {
  description = "Admin Password for Virtual Machines"
  default     = "Password12345"
}

variable "admin_username" {
  description = "Admin Username for Virtual Machines"
  default = "avid"
}

variable "nexis_storage_vm_public_ip_dns" {
  description = "description"
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
  default = "Standard_DS4_V2"
}

variable "nexis_storage_type" {
    description = ""
    default = "Nearline"
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

variable "tags" {
  description = "description"
  default = {
                "environment" = "dev"
            }
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
    "Nearline"  = "https://raw.githubusercontent.com/jamesptruitt/EditorialInTheCloudBYOL/master/scripts/installNexis.bash,installNexis.bash,https://ssengreleng.blob.core.windows.net/nexisgold/19.10.1/installers,AvidNexisCloud_19.10.1-13.run,0100-38171-00"
    "Cloud"     = "https://raw.githubusercontent.com/jamesptruitt/EditorialInTheCloudBYOL/master/scripts/installNexis.bash,installNexis.bash,https://ssengreleng.blob.core.windows.net/nexisgold/19.10.1/installers,AvidNexisCloud_19.10.1-13.run,0100-40109-00"
  }
}