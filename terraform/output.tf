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

output "codedeploy_app_name" {
  value = aws_codedeploy_deployment_group.this.app_name
}

output "codedeploy_group_name" {
  value = aws_codedeploy_deployment_group.this.deployment_group_name
}

output "dns_names" {
  value = values(aws_route53_record.this).*.name
}