# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# GRANT A USER ACCESS TO A REPOSITORY
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 0.12.26"

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.7.0"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE ACCESS GRANT
# ---------------------------------------------------------------------------------------------------------------------

resource "github_repository_collaborator" "collaborator" {
  username   = var.username
  repository = var.repository
  permission = var.permission
}
