module "output_resources" {
  source = "git::https://gitlab.com/infraprints/modules/aws/terraform-state-output"

  bucket = "infraprints-terraform-state-output"
  key    = "aws/infraprints/project/outputs.tf"

  terraform_output = [
    {
      key   = "s3_bucket"
      value = "infraprints-terraform-state-output"
    },
    {
      key   = "route53_hosted_zone"
      value = "AFIA123412341234"
    },
    {
      key   = "aws_account_id"
      value = "123412341234"
    },
  ]
}

