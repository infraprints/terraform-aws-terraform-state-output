locals {
  nameservers = [
    "127.0.0.1",
    "127.0.0.2",
    "127.0.0.3"
  ]
}

module "example" {
  source = "../../"

  bucket = aws_s3_bucket.outputs.id
  key    = "arrays/outputs.tf"

  terraform_output = [
    {
      key   = "terraform_remote_output"
      value = aws_s3_bucket.outputs.id
    },
    {
      key   = "route53_hosted_zone"
      value = "AFIAABCDEFGHIJK"
    },
    {
      key   = "nameservers"
      value = jsonencode(local.nameservers)
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
