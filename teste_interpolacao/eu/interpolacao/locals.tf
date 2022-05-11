locals {
  ip_filepath = "foto.jpg"
  common_tags = {
    Name        = "curso terraform"
    ManagedBy   = "terraform"
    Environment = var.environment
    owner       = "Alexandre"
  }
}