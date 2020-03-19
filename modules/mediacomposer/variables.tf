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
    "avid_nexis_client_url"         = "https://sadisneypofdeployment.blob.core.windows.net/installers/AvidNEXISClient_Win64_19.8.0.2.msi"
    "mediaComposer_url"             = "https://sadisneypofdeployment.blob.core.windows.net/installers/Media_Composer_2019.8_Win.zip"
    "teradici_url"                  = "https://sadisneypofdeployment.blob.core.windows.net/installers/PCoIP_agent_release_installer_2.11.0.9616_graphics.exe"
    "nvidia_url"                    = "https://sadisneypofdeployment.blob.core.windows.net/installers/442.06_grid_win10_64bit_international_whql.exe"
    "teradici_key"                  = "No_Key"
  }
}
