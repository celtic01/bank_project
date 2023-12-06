resource "random_password" "symmetric_key" {
  length  = 32
  special = false
}
