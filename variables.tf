# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "prefix" {
  description = "A string prepended to the generated result."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "length" {
  description = "The length of the generated string."
  type        = number
  default     = 24
}

variable "include_special_characters" {
  description = "Whether or not special characters should be included in the generated string."
  type        = bool
  default     = true
}
