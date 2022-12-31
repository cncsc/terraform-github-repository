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
# CREATE THE REPOSITORY
# ---------------------------------------------------------------------------------------------------------------------

resource "github_repository" "repo" {
  name         = var.name
  description  = var.description
  homepage_url = var.homepage_url
  topics       = var.topics
  is_template  = var.is_template
  archived     = var.archived
  auto_init    = var.auto_init

  # The visibility variable defaults to private, but there are valid use cases for public repos.
  # tfsec:ignore:github-repositories-private
  visibility = var.visibility

  dynamic "template" {
    for_each = var.template_owner != null && var.template_repository != null ? [1] : []
    content {
      owner      = var.template_owner
      repository = var.template_repository
    }
  }

  dynamic "pages" {
    for_each = var.pages_branch != null && var.pages_path != null ? [1] : []
    content {
      source {
        branch = var.pages_branch
        path   = var.pages_path
      }

      cname = var.pages_cname
    }
  }

  dynamic "security_and_analysis" {
    // Advanced security is automatically enabled for public repositories
    // This block is redundant (and potentially misleading) for public repositories.
    for_each = var.visibility != "public" && (var.advanced_security_enabled || var.secret_scanning_enabled || var.secret_scanning_push_protection_enabled) ? [1] : []

    content {
      advanced_security {
        status = var.advanced_security_enabled ? "enabled" : "disabled"
      }

      secret_scanning {
        status = var.secret_scanning_enabled ? "enabled" : "disabled"
      }

      secret_scanning_push_protection {
        status = var.secret_scanning_push_protection_enabled ? "enabled" : "disabled"
      }
    }
  }

  vulnerability_alerts                    = var.vulnerability_alerts
  ignore_vulnerability_alerts_during_read = var.ignore_vulnerability_alerts_during_read

  has_issues    = var.has_issues
  has_projects  = var.has_projects
  has_wiki      = var.has_wiki
  has_downloads = var.has_downloads

  allow_merge_commit   = var.allow_merge_commit
  merge_commit_title   = var.merge_commit_title
  merge_commit_message = var.merge_commit_message

  allow_squash_merge          = var.allow_squash_merge
  squash_merge_commit_title   = var.squash_merge_commit_title
  squash_merge_commit_message = var.squash_merge_commit_message

  allow_rebase_merge = var.allow_rebase_merge

  allow_update_branch = var.allow_update_branch

  delete_branch_on_merge = var.delete_branch_on_merge

  archive_on_destroy = var.archive_on_destroy
}

# ---------------------------------------------------------------------------------------------------------------------
# SET THE DEFAULT BRANCH
# ---------------------------------------------------------------------------------------------------------------------

resource "github_branch_default" "default" {
  count      = signum(length(var.default_branch))
  repository = github_repository.repo.name
  branch     = var.default_branch
}

# ---------------------------------------------------------------------------------------------------------------------
# GRANT READ (PULL) ACCESS TO TEAMS
# ---------------------------------------------------------------------------------------------------------------------

module "pull_teams" {
  for_each = var.pull_teams

  source = "./modules/team-repository"

  team_id    = each.value
  repository = github_repository.repo.name
  permission = "pull"
}

# ---------------------------------------------------------------------------------------------------------------------
# GRANT WRITE (PUSH) ACCESS TO TEAMS
# ---------------------------------------------------------------------------------------------------------------------

module "push_teams" {
  for_each = var.push_teams

  source = "./modules/team-repository"

  team_id    = each.value
  repository = github_repository.repo.name
  permission = "push"
}

# ---------------------------------------------------------------------------------------------------------------------
# GRANT ADMIN ACCESS TO TEAMS
# ---------------------------------------------------------------------------------------------------------------------

module "admin_teams" {
  for_each = var.admin_teams

  source = "./modules/team-repository"

  team_id    = each.value
  repository = github_repository.repo.name
  permission = "admin"
}

# ---------------------------------------------------------------------------------------------------------------------
# SETUP REPOSITORY PULL USERS
# ---------------------------------------------------------------------------------------------------------------------

module "pull_users" {
  for_each = var.pull_users

  source = "./modules/repository-collaborator"

  username   = each.value
  repository = github_repository.repo.name
  permission = "pull"
}

# ---------------------------------------------------------------------------------------------------------------------
# SETUP REPOSITORY PUSH USERS
# ---------------------------------------------------------------------------------------------------------------------

module "push_users" {
  for_each = var.push_users

  source = "./modules/repository-collaborator"

  username   = each.value
  repository = github_repository.repo.name
  permission = "push"
}

# ---------------------------------------------------------------------------------------------------------------------
# SETUP REPOSITORY ADMIN USERS
# ---------------------------------------------------------------------------------------------------------------------

module "admin_users" {
  for_each = var.admin_users

  source = "./modules/repository-collaborator"

  username   = each.value
  repository = github_repository.repo.name
  permission = "admin"
}

# ---------------------------------------------------------------------------------------------------------------------
# SETUP REPOSITORY LABELS
# ---------------------------------------------------------------------------------------------------------------------

resource "github_issue_label" "labels" {
  for_each = { for k, v in var.labels : k.name => v }

  repository  = github_repository.repo.name
  name        = each.key
  description = each.value.description
  color       = each.value.color
}
