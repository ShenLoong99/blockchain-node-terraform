output "node_public_ip" {
  value = aws_instance.blockchain_node.public_ip
}

output "private_key" {
  value     = tls_private_key.node_key.private_key_openssh
  sensitive = true
}