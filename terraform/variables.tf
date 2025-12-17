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
  description = "EC2 instance type"
  type        = string
  default     = "blockchain-node-key"
}

# variable "ssh_cidr_blocks" {
#   type        = list(string)
#   description = "CIDRs allowed to SSH into the node"
#   default     = ["161.142.156.205/32"]
# }

# variable "ssh_public_key" {
#   type        = string
#   description = "Public SSH key for EC2 access"
# }