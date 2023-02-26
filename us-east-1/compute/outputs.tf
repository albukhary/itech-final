output "instance_public_dns" {
  value = module.compute.instance1_public_dns
}

output "instance_public_ip" {
  value = module.compute.instance1_public_ip
}

output "instance_id" {
  value = module.compute.instance1_id
}

output "sg_id" {
  value = module.compute.sg_id
}