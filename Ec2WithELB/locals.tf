locals {
  common_tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
    billing_code = "${terraform.workspace == "default" ? var.billing_code : var.meutest}"
    # billing_code = var.billing_code
  }
}