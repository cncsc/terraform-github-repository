# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# GRANT A TEAM ACCESS TO A REPOSITORY
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 0.12.26"

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.12.0"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE ACCESS GRANT
# ---------------------------------------------------------------------------------------------------------------------

resource "github_team_repository" "team_repository" {
  team_id    = var.team_id
  repository = var.repository
  permission = var.permission
}
