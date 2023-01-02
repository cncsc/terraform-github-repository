# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY A GITHUB REPOSITORY WITH DEFAULT SETTINGS
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
# CREATE THE BRANCH PROTECTION RULE
# ---------------------------------------------------------------------------------------------------------------------

resource "github_branch_protection" "branch_protection_rule" {
  repository_id          = var.repository_id
  pattern                = var.pattern
  enforce_admins         = var.enforce_admins
  require_signed_commits = var.require_signed_commits
  push_restrictions      = var.push_restrictions

  required_status_checks {
    strict   = var.strict
    contexts = var.required_status_checks
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = var.dismiss_stale_reviews
    require_code_owner_reviews      = var.require_code_owner_reviews
    dismissal_restrictions          = var.review_dismissal_restrictions
    required_approving_review_count = var.required_approving_review_count
  }
}
