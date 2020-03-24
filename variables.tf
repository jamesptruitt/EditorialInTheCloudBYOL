#########################
# General               #
#########################
resource "random_string" "general" {
    length  = 5
    special = false
    upper   = false
}
variable "subscription_id" {
  description = "" 
}

variable "tenant_id" {
  description = "The tenant id for the Service Principal"
}

variable "client_id" {
  description = "The client id for the Service Principal"
}

variable "client_secret" {
  description = "The client secret for the Service Principal"
}