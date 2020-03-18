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
  default = 1
}

variable "mediacomposer_vm_size" {
  description = "description"
  default = "Standard_DS4_V2"
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
    "mediaworker_vm_script_url"     = "https://raw.githubusercontent.com/jamesptruitt/EditorialInTheCloudWithAvid/master/scripts/SetupWorkerMachine.ps1"
    "avid_nexis_client_url"         = "https://github.com/jamesptruitt/EditorialInTheCloudWithAvid/raw/master/installs/AvidNEXISClient_Win64_19.5.0.7.msi"
    "google_chrome_enterprise_url"  = "https://github.com/jamesptruitt/EditorialInTheCloudWithAvid/raw/master/installs/googlechromestandaloneenterprise64.msi"
    "putty_url"                     = "https://github.com/jamesptruitt/EditorialInTheCloudWithAvid/raw/master/installs/putty-64bit-0.71-installer.msi"
    "mam_control_service_url"       = "https://github.com/jamesptruitt/EditorialInTheCloudWithAvid/raw/master/installs/MAMControlService_3.1.0.216.exe"
  }
}
