output "node_public_ip" {
  value = aws_instance.blockchain_node.public_ip
}

output "my_ip" {
  value = local.ssh_cidr_blocks[0]
}