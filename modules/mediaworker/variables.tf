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

variable "mediaworker_vm_os_simple"{   
  description = "description"                 
  default = "WindowsServer"
}

variable "mediaworker_vm_os_id"{   
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
    "avid_nexis_client_url"         = "https://editorialbyol.blob.core.windows.net/installers/AvidNEXISClient_Win64_19.12.1.9.msi"
    "google_chrome_enterprise_url"  = "https://editorialbyol.blob.core.windows.net/installers/googlechromestandaloneenterprise64.msi"
    "putty_url"                     = "https://editorialbyol.blob.core.windows.net/installers/putty-64bit-0.71-installer.msi"
    "mam_control_service_url"       = "https://editorialbyol.blob.core.windows.net/installers/MAMControlService_3.1.0.216.exe"
  }
}
