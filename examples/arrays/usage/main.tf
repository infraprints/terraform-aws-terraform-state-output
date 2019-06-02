module "example" {
  source = "s3::https://s3.amazonaws.com/TERRAFORM_BUCKET/arrays"
}

output "terraform_remote_output" {
  value = module.example.terraform_remote_output
}

output "route53_hosted_zone" {
  value = module.example.route53_hosted_zone
}

output "nameservers" {
  value = module.example.nameservers
}
