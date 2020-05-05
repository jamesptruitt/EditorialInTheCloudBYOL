#########################
# General               #
#########################
resource "random_string" "general" {
    length  = 5
    special = false
    upper   = false
}

variable "resource_group_name" {
    description = ""
}              

variable "location" {
    description = ""
} 

variable "admin_username" {
    description = "azureuser"
}

variable "admin_password" {
    description = ""
} 

variable "address_space" {
    description = ""
}

variable "subnet_prefixes" {
    description = ""
}

variable "dns_servers" {
    description = ""
}

variable "subnet_names" {
    description = ""
} 

variable "source_address_prefix" {
    description = ""
} 

variable "jump_box_vm_size" {
    description = ""
}

variable "jump_box_base_index" {
    description = ""
}

variable "jump_box_vm_instances" {
    description = ""
}

variable "jump_box_vm_number_public_ip" {
    description = ""
}  

variable "mediacomposer_vm_size" {
    description = ""
}

variable "mediacomposer_base_index" {
    description = ""
}

variable "mediacomposer_vm_instances" {
    description = ""
}

variable "mediacomposer_vm_number_public_ip" {
    description = ""
}

variable "nexis_vm_size" {
    description = ""
}

variable "nexis_base_index" {
    description = ""
}

variable "nexis_instances" {
    description = ""
}

variable "nexis_storage_vm_number_public_ip" {
    description = ""
}

variable "nexis_type" {
    description = ""
}    

variable "mediaworker_vm_size" {
    description = ""
}

variable "mediaworker_base_index" {
    description = ""
}

variable "mediaworker_vm_instances" {
    description = ""
}

variable "mediaworker_vm_number_public_ip" {
    description = "" 
}

variable "media_central_vm_size" {
    description = ""
}

variable "media_central_base_index" {
    description = ""
}

variable "media_central_vm_instances" {
    description = ""
}

variable "media_central_vm_number_public_ip" {
    description = ""
}

variable "shared_image_gallery_subscription_id" {
    description = ""
}

variable "shared_image_gallery_client_id" {
    description = ""
}

variable "shared_image_gallery_client_secret" {
    description = ""
}

variable "shared_image_gallery_tenant_id" {
    description = ""
}

variable "gallery_name" {
    description = ""
}

variable "gallery_resource_group_name" {
    description = ""
}  

variable "media_composer_image_version" {
    description = ""
}

variable "media_composer_image_name" {
    description = ""
}

variable "nexis_image_version" {
    description = ""
}

variable "nexis_image_name" {
    description = "" 
}

variable "media_central_image_version" {
    description = ""
}

variable "media_central_image_name" {
    description = "" 
}

variable "media_worker_image_version" {
    description = ""
}

variable "media_worker_image_name" {
    description = "" 
}

variable "jumpbox_image_version" {
    description = ""
}

variable "jumpbox_image_name" {
    description = "" 
}

variable "azureTags" {
    description = ""
}