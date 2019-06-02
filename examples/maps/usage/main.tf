module "example" {
  source = "s3::https://s3.amazonaws.com/TERRAFORM_BUCKET/maps"
}

output "aws_account_id" {
  value = "${module.example.aws_account_id}"
}

output "route53_hosted_zone" {
  value = "${module.example.route53_hosted_zone}"
}

output "s3_bucket" {
  value = "${module.example.s3_bucket}"
}

output "tags" {
  value = "${module.example.tags}"
}
