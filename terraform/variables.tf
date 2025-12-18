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

variable "my_local_ip" {
  type        = string
  description = "My local public IP address (e.g., 1.2.3.4/32)"
}

# variable "ssh_public_key" {
#   type        = string
#   description = "Public SSH key for EC2 access"
#   default     = file("blockchain-node-key.pub")
# }