# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "repository_id" {
  description = "The ID of the repository in which this branch protection rule will be created."
  type        = string
}

variable "pattern" {
  description = "The pattern identifying branches to which this protection rule will apply."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "enforce_admins" {
  description = "Setting this to true enforces status checks for repository administrators. In general this should be false to allow admins and service accounts to reconcile branches after a release without creating trailing merge commits -- branches would never be current with one another."
  type        = bool
  default     = true
}

variable "required_status_checks" {
  description = "A list of status checks (contexts) that must pass before a branch can be merged into the protected branch."
  type        = set(string)
  default     = []
}

variable "strict" {
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
  description = "The list of actor IDs with dismissal access."
  type        = set(string)
  default     = []
}

variable "required_approving_review_count" {
  description = "The number of approvals required to satisfy branch protection requirements. This must be a number between 1 and 6."
  type        = number
  default     = 1
}
