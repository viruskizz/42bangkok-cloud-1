variable "region" {
  description = "Value of AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "project" {
  description = "Owner of this project"
  type = string
  default = "42Bangkok"
}

variable "service" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Cloud1"
}

variable "key-pair" {
  description = "Value of AWS SSH key-pair name"
  type        = string
  default     = "42Bangkok-keypair"
}

variable "domain_name" {
  type = string
  default = "42.goodgeek.club"
}

variable "number" {
  default = 1
  type = number
}

variable "subnet_ids" {
  type = list(string)
  default = [
    "subnet-b6a825ef",
    "subnet-3905d35f",
    "subnet-3fca0c77",
  ]
}

variable "app_names" {
  type = list(string)
  default = [
    "one",
    "two"
  ]
}

variable "db_password" {
  type = string
}