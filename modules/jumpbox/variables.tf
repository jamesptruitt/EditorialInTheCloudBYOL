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

variable "jump_box_vm_public_ip_dns" {
  description = "description"
  default = []
}

variable "jump_box_vm_number_public_ip" {
  description = "description"
  default = 0
}

variable "jump_box_vm_remote_port" {
  description = "description"
  default = 3389
}

variable "jump_box_vm_instances" {
  description = "description"
}

variable "jump_box_vm_size" {
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
resource "random_string" "mediacomposer" {
    length  = 5
    special = false
    upper   = false
}

#########################
# Maps                  #
#########################
variable "software_install_urls" {
  default ={
    "mediacomposer_vm_script_url"   = "https://raw.githubusercontent.com/jamesptruitt/EditorialInTheCloudBYOL/master/scripts/setupMediaComposer.ps1"
    "avid_nexis_client_url"         = "https://github.com/jamesptruitt/EditorialInTheCloudBYOL/raw/master/installs/AvidNEXISClient_Win64_19.12.1.9.msi"
    "mediaComposer_url"             = "https://devterraforminstalls.blob.core.windows.net/installers/Media_Composer_2019.12_Win.zip"
    "teradici_url"                  = "https://github.com/jamesptruitt/EditorialInTheCloudBYOL/raw/master/installs/PCoIP_agent_release_installer_2.11.0.9616_graphics.exe"
    "nvidia_url"                    = "https://github.com/jamesptruitt/EditorialInTheCloudBYOL/raw/master/installs/442.06_grid_win10_64bit_international_whql.exe"
    "teradici_key"                  = "No_Key"
  }
}
