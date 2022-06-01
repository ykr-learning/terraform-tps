variable "project" {
  description = "Map of project names to configuration"
  type        = map(any)
  default = {
    project-alpha = {
      public_subnet_count  = 2,
      private_subnet_count = 2,
      instances_per_subnet = 2,
      instance_type        = "t2.micro",
      environment          = "dev"
    },
    project-beta = {
      public_subnet_count  = 1,
      private_subnet_count = 1,
      instances_per_subnet = 2,
      instance_type        = "t2.nano",
      environment          = "test"
    }
  }
}
