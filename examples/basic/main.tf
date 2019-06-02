module "example" {
  source = "../../"

  bucket = aws_s3_bucket.outputs.id
  key    = "basic/outputs.tf"

  terraform_output = [
    {
      key   = "terraform_remote_output"
      value = aws_s3_bucket.outputs.id
    },
    {
      key   = "lambda_artifacts"
      value = "my-lambda-artifacts"
    },
    {
      key   = "ci_cd_role_arn"
      value = "arn:aws:iam::123412341234:role/CICDLambda"
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
