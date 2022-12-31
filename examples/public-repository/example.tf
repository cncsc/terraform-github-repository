terraform {
  required_version = ">= 0.12.26"

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.12.0"
    }
  }
}

provider "github" {
  owner = "cncsc"
}

module "github_repository" {
  source = "../../"

  name        = "terratest-example-public-repository"
  description = "An example repository used for testing Terraform-based deployments of a GitHub repository."
  visibility  = "public"

  # Set this to avoid naming collisions during consecuritive CI runs.
  archive_on_destroy = false
}
