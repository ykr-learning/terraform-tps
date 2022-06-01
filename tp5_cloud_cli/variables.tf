variable "var_access_key" {
  type        = string
  description = "AWS access key."
  sensitive   = true
}

variable "var_secret_key" {
  type        = string
  description = "AWS secret key."
  sensitive   = true
}

variable "var_username" {
  type        = string
  description = "Nickname"
}
