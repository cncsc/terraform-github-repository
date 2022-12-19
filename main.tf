# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# EXAMPLE MODULE THAT GENERATES A RANDOM STRING
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 0.12.26"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.3"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# GENERATE THE VARIABLE PORTION OF THE OUTPUT STRING
# ---------------------------------------------------------------------------------------------------------------------

resource "random_string" "random" {
  length  = var.length
  special = var.include_special_characters
}
