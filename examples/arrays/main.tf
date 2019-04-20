locals {
  nameservers = ["127.0.0.1", "127.0.0.2", "127.0.0.3"]
}

module "example" {
  source = "../../"

  bucket = "infraprints-terraform-state-output-example"
  key    = "arrays/outputs.tf"

  outputs = [
    {
      key   = "s3_bucket"
      value = "infraprints-terraform-state-output-example"
    },
    {
      key   = "route53_hosted_zone"
      value = "AFIA123412341234"
    },
    {
      key   = "aws_account_id"
      value = "123412341234"
    },
    {
      key   = "nameservers"
      value = "${jsonencode(local.nameservers)}"
    },
  ]
}