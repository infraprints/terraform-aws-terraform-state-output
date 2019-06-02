locals {
  tags = {
    name        = "project"
    description = "The description"
  }

  # ["127.0.0.1", "127.0.0.2", "127.0.0.3"]
}

module "example" {
  source = "../../"

  bucket = aws_s3_bucket.outputs.id
  key    = "maps/outputs.tf"

  terraform_output = [
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
      key   = "tags"
      value = jsonencode(local.tags)
    },
  ]
}


resource "aws_s3_bucket" "outputs" {
  bucket = "infraprints-terraform-state-output-example"
}

