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

variable "mediacomposer_vm_public_ip_dns" {
  description = "description"
}

variable "mediacomposer_vm_number_public_ip" {
  description = "description"
}

variable "mediacomposer_vm_remote_port" {
  description = "description"
  default = 3389
}

variable "mediacomposer_vm_instances" {
  description = "description"
}

variable "mediacomposer_vm_size" {
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
    "avid_nexis_client_url"         = "https://github.com/jamesptruitt/EditorialInTheCloudBYOL/raw/master/installs/AvidNEXISClient_Win64_19.5.0.7.msi"
    "google_chrome_enterprise_url"  = "https://github.com/jamesptruitt/EditorialInTheCloudBYOL/raw/master/installs/googlechromestandaloneenterprise64.msi"
    "putty_url"                     = "https://github.com/jamesptruitt/EditorialInTheCloudBYOL/raw/master/installs/putty-64bit-0.71-installer.msi"
    "mediaComposer_url"             = "https://github.com/jamesptruitt/EditorialInTheCloudBYOL/raw/master/installs/Media_Composer_2019.12_Win.zip"
    "teradici_url"                  = "https://github.com/jamesptruitt/EditorialInTheCloudBYOL/raw/master/installs/PCoIP_agent_release_installer_2.11.0.9616_graphics.exe"
    "nvidia_url"                    = "https://github.com/jamesptruitt/EditorialInTheCloudBYOL/raw/master/installs/412.16_grid_win10_server2016_64bit_international.exe"
    "teradici_key"                  = ""
  }
}
