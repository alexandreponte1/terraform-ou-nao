## Providers Example

provider "azurerm" {
  version = "3.39.1"
  features {}

}



### AWS

provider "aws" {
  region  = var.aws_region
  version = "4.50.0"
  profile = var.aws_profile
}