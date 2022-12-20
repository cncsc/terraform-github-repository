# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "team_id" {
  description = "The name or identifier of the team being granted permissions."
  type        = string
}

variable "repository" {
  description = "The name of the repository to which the team is being granted permissions."
  type        = string
}

variable "permission" {
  description = "The level of access being granted to the team. One of `pull`, `push`, or `admin`."
  type        = string
}
