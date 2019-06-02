module "example" {
  source = "s3::https://s3.amazonaws.com/infraprints-terraform-state-output/aws/infraprints/project"
}

output "aws_account_id" {
  value = module.example.aws_account_id
}

output "topics" {
  value = module.example.topics
}

output "tags" {
  value = module.example.tags
}
