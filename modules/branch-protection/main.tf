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
  repository_id                   = var.repository_id
  pattern                         = var.pattern
  enforce_admins                  = var.enforce_admins
  require_signed_commits          = var.require_signed_commits
  push_restrictions               = var.push_restrictions
  allows_deletions                = var.allows_deletions
  blocks_creations                = var.blocks_creations
  allows_force_pushes             = var.allows_force_pushes
  lock_branch                     = var.lock_branch
  required_linear_history         = var.require_linear_history
  require_conversation_resolution = var.require_conversation_resolution

  required_status_checks {
    strict   = var.strict
    contexts = var.required_status_checks
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = var.dismiss_stale_reviews
    require_code_owner_reviews      = var.require_code_owner_reviews
    dismissal_restrictions          = var.review_dismissal_restrictions
    required_approving_review_count = var.required_approving_review_count
    pull_request_bypassers          = var.pull_request_bypassers
    require_last_push_approval      = var.require_last_push_approval
  }
}
