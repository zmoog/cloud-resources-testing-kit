
variable "owner" {
  type        = string
  description = "The owner of the resources created by this module"

  validation {
    condition     = length(var.owner) > 0
    error_message = "You must set a valid owner using your first and last name (use `jdoe` for John Doe)."
  }
}

variable "region" {
  type        = string
  description = "The AWS region to deploy to"
  default     = "eu-west-1"

  validation {
    condition     = length(var.region) > 0
    error_message = "You must set a valid AWS region (e.g. eu-west-1)."
  }
}
