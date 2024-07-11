variable "region" {
  description = "Value of AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "cloud"
}

variable "key-pair" {
  description = "Value of AWS SSH key-pair name"
  type        = string
  default     = "my-keypair"
}

variable "number" {
  default = 1
  type = number
}