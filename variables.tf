#########################
# General               #
#########################
resource "random_string" "general" {
    length  = 5
    special = false
    upper   = false
}