locals {
  tags = {
    name        = "project"
    description = "The description"
  }
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

##
## State bucket
##

resource "random_id" "default" {
  byte_length = 24
}

locals {
  bucket = "infraprints-${random_id.default.hex}"
}

resource "aws_s3_bucket" "outputs" {
  bucket = local.bucket
}

output "bucket_name" {
  value = local.bucket
}
