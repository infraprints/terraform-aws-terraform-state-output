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
      key   = "terraform_remote_output"
      value = aws_s3_bucket.outputs.id
    },
    {
      key   = "name"
      value = "project"
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
