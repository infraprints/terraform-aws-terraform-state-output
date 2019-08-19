module "example" {
  source = "s3::https://s3.amazonaws.com/TERRAFORM_BUCKET/maps"
}

output "terraform_remote_output" {
  value = module.example.terraform_remote_output
}

output "name" {
  value = module.example.name
}

output "tags" {
  value = module.example.tags
}

output "description" {
  value = module.example.tags.description
}