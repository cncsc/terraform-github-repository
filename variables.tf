# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the repository."
  type        = string
}

variable "description" {
  description = "A description of the repository."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "auto_init" {
  description = "Set to `true` to produce an initial commit in the repository. This is required in order to set the default branch on a new repository, but may be set to `false` on imported repositories."
  type        = bool
  default     = true
}

variable "topics" {
  description = "A list of topics for the repository."
  type        = set(string)
  default     = []
}

variable "visibility" {
  description = "Determines the visibility of the repository. One of `private`, `public`, or `internal`. Note that `internal` is only available for GitHub Enterprise tiers."
  type        = string
  default     = "private"
}

variable "homepage_url" {
  description = "URL of a page describing the project."
  type        = string
  default     = ""
}

variable "template_owner" {
  description = "The owner of the template repository."
  type        = string
  default     = null
}

variable "template_repository" {
  description = "The name of the template repository."
  type        = string
  default     = null
}

variable "has_issues" {
  description = "Set to `true` to enable the GitHub Issues features on the repository."
  type        = bool
  default     = false
}

variable "has_projects" {
  description = "Set to `true` to enable the GitHub Projects features on the repository."
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = "Set to `true` to enable the GitHub Wiki features on the repository."
  type        = bool
  default     = false
}

variable "has_downloads" {
  description = "Set to `true` to enable the (deprecated) downloads features on the repository."
  type        = bool
  default     = false
}

variable "allow_merge_commit" {
  description = "Set to false to disable merge commits on the repository."
  type        = bool
  default     = true
}

variable "merge_commit_title" {
  description = "The default merge commit title. One of `PR_TITLE` or `MERGE_MESSAGE`."
  type        = string
  default     = "MERGE_MESSAGE"
}

variable "merge_commit_message" {
  description = "The default merge commit message. One of `PR_BODY`, `PR_TITLE`, or `BLANK`."
  type        = string
  default     = "PR_TITLE"
}

variable "allow_squash_merge" {
  description = "Set to false to disable squash merges on the repository."
  type        = bool
  default     = true
}

variable "squash_merge_commit_title" {
  description = "The default squash merge commit title. One of `PR_TITLE` or `COMMIT_OR_PR_TITLE`."
  type        = string
  default     = "COMMIT_OR_PR_TITLE"
}

variable "squash_merge_commit_message" {
  description = "The default squash merge commit message. One of `PR_BODY`, `COMMIT_MESSAGES`, or `BLANK`."
  type        = string
  default     = "COMMIT_MESSAGES"
}

variable "allow_rebase_merge" {
  description = "Set to `false` to disable rebase merges on the repository."
  type        = bool
  default     = true
}

variable "allow_update_branch" {
  description = "Set to `true` to always suggest updating pull request branches."
  type        = bool
  default     = true
}

variable "delete_branch_on_merge" {
  description = "Automatically delete head branch after a pull request is merged."
  type        = bool
  default     = true
}

variable "archived" {
  description = "Specifies if the repository should be archived."
  type        = bool
  default     = false
}

variable "pull_teams" {
  description = "A set of teams allowed to pull this repository."
  type        = set(string)
  default     = []
}

variable "push_teams" {
  description = "A set of team IDs allowed to push to this repository."
  type        = set(string)
  default     = []
}

variable "admin_teams" {
  description = "A set of team IDs allowed to administer this repository."
  type        = set(string)
  default     = []
}

variable "pull_users" {
  description = "A set of GitHub users' IDs allowed to read this repository."
  type        = set(string)
  default     = []
}

variable "push_users" {
  description = "A set of GitHub users' IDs allowed to write to this repository."
  type        = set(string)
  default     = []
}

variable "admin_users" {
  description = "A set of GitHub users' IDs allowed to admin this repository."
  type        = set(string)
  default     = []
}


variable "is_template" {
  description = "Whether or not this repository is a template repository."
  type        = bool
  default     = false
}

variable "archive_on_destroy" {
  description = "Set to `true` to archive the repository instead of deleting on destroy."
  type        = bool
  default     = true
}

variable "pages_branch" {
  description = "The repository branch used to publish the site's source files."
  type        = string
  default     = null
}

variable "pages_path" {
  description = "The path from which the site publishes GitHub pages."
  type        = string
  default     = null
}

variable "pages_cname" {
  description = "The custom domain for the repository. This can only be set after the repository has been created."
  type        = string
  default     = null
}

variable "advanced_security_enabled" {
  description = "Whether or not advanced security features are enabled on the repository. This setting has no effect in public repositories which has this feature enabled by default."
  type        = bool
  default     = true
}

variable "secret_scanning_enabled" {
  description = "Whether or not secret scanning is enabled on the repository. This setting has no effect in public repositories which has this feature enabled by default."
  type        = bool
  default     = true
}

variable "secret_scanning_push_protection_enabled" {
  description = "Whether or not secret scanning push protection is enabled on the repository. This setting has no effect in public repositories which has this feature enabled by default."
  type        = bool
  default     = true
}

variable "vulnerability_alerts" {
  description = "Whether or not security alerts for vulnerable dependencies are enabled on the repository."
  type        = bool
  default     = true
}

variable "ignore_vulnerability_alerts_during_read" {
  description = "Set to `true` to omit calling the vulnerability alerts endpoint so the resource can also be used without admin permissions during read."
  type        = bool
  default     = true
}

variable "default_branch" {
  description = "The name of the default branch for the repository."
  type        = string
  default     = "main"
}

variable "branch_protection_enforce_admins" {
  description = "Setting this to true enforces status checks for repository administrators. In general this should be false to allow admins and service accounts to reconcile branches after a release without creating trailing merge commits -- branches would never be current with one another."
  type        = bool
  default     = true
}

variable "branch_protection_required_status_checks" {
  description = "A set of status checks (contexts) that must pass before a branch can be merged into the protected branch."
  type        = set(string)
  default     = []
}

variable "branch_protection_strict" {
  description = "Setting this to true enforces that a branch be current with the base branch before merging."
  type        = bool
  default     = true
}

variable "dismiss_stale_reviews" {
  description = "Dismiss approved reviews automatically when a new commit is pushed."
  type        = bool
  default     = true
}

variable "require_code_owner_reviews" {
  description = "Whether or not an approval is required from code owners to merge a pull request."
  type        = bool
  default     = true
}

variable "require_signed_commits" {
  description = "Requires all commits in the branch to be signed with GPG."
  type        = bool
  default     = true
}

variable "push_restrictions" {
  description = "A list of actor IDs that are explicitly permitted to push to the branch. Admins have this capability if `enforce_admins` is false."
  type        = set(string)
  default     = []
}

variable "review_dismissal_restrictions" {
  description = "The list of actor IDs with permission to dismiss reviews."
  type        = set(string)
  default     = []
}

variable "required_approving_review_count" {
  description = "The number of approvals required to satisfy branch protection requirements. This must be a number between 1 and 6."
  type        = number
  default     = 1
}

variable "labels" {
  description = "A set of labels to configure for the repository."
  type = set(object({
    name        = string,
    description = string,
    color       = string
  }))
  default = []
}
