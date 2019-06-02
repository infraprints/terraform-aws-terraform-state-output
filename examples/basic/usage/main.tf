module "example" {
  source = "s3::https://s3.amazonaws.com/TERRAFORM_BUCKET/basic"
}

output "terraform_remote_output" {
  value = "${module.example.terraform_remote_output}"
}

output "lambda_artifacts" {
  value = "${module.example.lambda_artifacts}"
}

output "ci_cd_role_arn" {
  value = "${module.example.ci_cd_role_arn}"
}
