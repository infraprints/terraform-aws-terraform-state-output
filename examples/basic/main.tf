module "example" {
  source = "../../"

  bucket = aws_s3_bucket.outputs.id
  key    = "basic/outputs.tf"

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
  ]
}


resource "aws_s3_bucket" "outputs" {
  bucket = "infraprints-terraform-state-output-example"
}

