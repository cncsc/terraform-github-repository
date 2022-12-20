# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "username" {
  description = "The username of the user being granted access to the repository."
  type        = string
}

variable "repository" {
  description = "The name of the repository to which the user is being granted permissions."
  type        = string
}

variable "permission" {
  description = "The level of access being granted to the user. One of `pull`, `push`, or `admin`."
  type        = string
}
