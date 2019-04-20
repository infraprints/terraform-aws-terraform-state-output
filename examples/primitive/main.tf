module "example" {
  source = "../../"

  bucket = "infraprints-terraform-state-output-example"
  key    = "primitive/outputs.tf"

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
  ]
}
