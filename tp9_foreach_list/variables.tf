
variable "project" {
  description = "project names"
  type        = list(string)
  default = [
    "project-a",
    "project-b"
  ]
}