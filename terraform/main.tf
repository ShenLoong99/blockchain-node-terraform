provider "aws" {
  region = var.aws_region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

data "http" "my_ip" {
  url = "https://ifconfig.me/ip"
}

locals {
  ssh_cidr_blocks = ["${chomp(data.http.my_ip.response_body)}/32"]
}

resource "aws_instance" "blockchain_node" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.node_sg.id]
  key_name               = aws_key_pair.node_key.key_name
  user_data              = file("${path.module}/user_data.sh")

  #   provisioner "local-exec" {
  #     command = "chmod 600 ${local_file.private_key_pem.filename}"
  #   }

  tags = {
    Type = "blockchain-node"
    Name = "ethereum-sepolia-node"
  }

  lifecycle {
    ignore_changes = [security_groups]
  }

}

resource "tls_private_key" "node_key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "node_key" {
  key_name   = var.key_name
  public_key = file("${path.module}/ssh/blockchain-node-key.pub")

  lifecycle {
    ignore_changes = [key_name]
  }
}

resource "local_file" "private_key_file" {
  content         = tls_private_key.node_key.private_key_pem
  filename        = "blockchain-node-key"
  file_permission = "0600"

  lifecycle {
    ignore_changes = [content, filename]
  }
}