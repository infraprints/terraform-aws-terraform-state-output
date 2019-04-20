module "example" {
  source = "../../"

  bucket = "infraprints-terraform-state-output-example"
  key    = "syntax/outputs.tf"

  terraform_output {
    "key"   = "s3_bucket"
    "value" = "infraprints-terraform-state-output-example"
  }

  terraform_output {
    "key"   = "route53_hosted_zone"
    "value" = "AFIA123412341234"
  }

  terraform_output {
    "key"   = "aws_account_id"
    "value" = "123412341234"
  }
}
