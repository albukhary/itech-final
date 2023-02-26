output "instance_public_dnss" {
  value = aws_instance.app-server1.*.public_dns
}

output "instance_public_ips" {
  value = aws_instance.app-server1.*.public_ip
}

output "instance_ids" {
  value = aws_instance.app-server1.*.id
}

output "sg_id" {
  value = aws_security_group.http-sg.id
}