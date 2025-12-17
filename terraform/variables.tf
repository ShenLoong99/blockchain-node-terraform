variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Optional SSH key name"
  default     = null
}

variable "p2p_cidr_blocks" {
  description = "Allowed CIDR blocks for blockchain P2P traffic"
  type        = list(string)
  default     = []
}