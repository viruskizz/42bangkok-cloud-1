output "instances" {
  value = aws_instance.this
}

output "instance_ips" {
  value = aws_instance.this.*.public_ip
}

output "public_keypair" {
  description = "Public key of oe-key-pair"
  value       = tls_private_key.this.public_key_openssh
  sensitive   = true
}

output "private_keypair" {
  description = "Private key of oe-key-pair"
  value       =  tls_private_key.this.private_key_pem
  sensitive   = true
}