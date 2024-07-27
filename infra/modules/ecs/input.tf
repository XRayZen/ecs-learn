
variable "project_name" {
  type        = string
  description = "project name"
}

variable "environment" {
  type        = string
  description = "environment"
}

variable "availability_zones" {
  type        = list(string)
  description = "availability zones"
}

variable "ecs_subnet_ids" {
  type        = list(string)
  description = "ecs subnet ids"
}

variable "ecr_address" {
  type        = string
  description = "ecr address"
}

variable "ecs_cluster_name" {
  type        = string
  description = "ecs cluster name"
}

variable "ecs_service_name" {
  type        = string
  description = "ecs service name"
}


variable "vpc_cidr_block" {
  type        = string
  description = "vpc cidr block"
}

variable "container_environment" {
  description = "Environment variables for the container"
  type = list(object({
    name  = string
    value = string
  }))
  default = [
    {
      name  = "MY_VARIABLE"
      value = "Hello World!!"
    }
  ]
}

variable "hello_app_image_tag" {
  description = "hello app image tag"
  type        = string
  default     = "latest"
}

