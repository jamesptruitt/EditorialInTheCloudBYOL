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
}

variable "mediaworker_vm_public_ip_dns" {
  description = "description"
}

variable "mediaworker_vm_number_public_ip" {
  description = "description"
}

variable "mediaworker_vm_remote_port" {
  description = "description"
  default = 3389
}

variable "mediaworker_vm_instances" {
  description = "description"
}

variable "mediaworker_vm_size" {
  description = "description"
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

variable "tags" {
  description = "description"
}

#########################
# General Variables     #
#########################
resource "random_string" "mediaworker" {
    length  = 5
    special = false
    upper   = false
}

#########################
# Maps                  #
#########################
variable "software_install_urls" {
  default ={
    "mediaworker_vm_script_url"     = "https://raw.githubusercontent.com/jamesptruitt/EditorialInTheCloudBYOL/master/scripts/SetupWorkerMachine.ps1"
    "avid_nexis_client_url"         = "https://github.com/jamesptruitt/EditorialInTheCloudBYOL/raw/master/installs/AvidNEXISClient_Win64_19.5.0.7.msi"
    "google_chrome_enterprise_url"  = "https://github.com/jamesptruitt/EditorialInTheCloudBYOL/raw/master/installs/googlechromestandaloneenterprise64.msi"
    "putty_url"                     = "https://github.com/jamesptruitt/EditorialInTheCloudBYOL/raw/master/installs/putty-64bit-0.71-installer.msi"
    "mam_control_service_url"       = "https://github.com/jamesptruitt/EditorialInTheCloudBYOL/raw/master/installs/MAMControlService_3.1.0.216.exe"
  }
}
