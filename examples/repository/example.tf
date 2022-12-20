terraform {
  required_version = ">= 0.12.26"

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.7.0"
    }
  }
}

provider "github" {
  owner = "cncsc"
}

module "github_repository" {
  source = "../../"

  name        = "terratest-example-repository"
  description = "An example repository used for testing Terraform-based deployments of a GitHub repository."

  read_teams = [
    "infrastructure-reviewers"
  ]

  write_teams = [
    "devops-reviewers"
  ]

  admin_teams = [
    "conventions-reviewers"
  ]

  admin_users = [
    "cncsc-ci-bot"
  ]

  # These are not available in private repositories of free-tier orgs.
  advanced_security_enabled               = false
  secret_scanning_enabled                 = false
  secret_scanning_push_protection_enabled = false

  # Set this to avoid naming collisions during consecuritive CI runs.
  archive_on_destroy = false
}
