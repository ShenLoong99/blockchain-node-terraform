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

resource "aws_instance" "blockchain_node" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.node_sg.id]
  key_name               = aws_key_pair.node_key.key_name
  user_data              = file("${path.module}/user_data.sh")

  tags = {
    Type = "blockchain-node"
    Name = "ethereum-sepolia-node"
  }
}

resource "aws_key_pair" "node_key" {
  key_name   = "blockchain-node-key"
  public_key = file("~/.ssh/blockchain-node-key.pub")
}
