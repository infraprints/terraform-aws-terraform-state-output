locals {
  topics = ["aws", "s3", "terraform"]
  tags = {
    name        = "infraprints",
    description = "Infrastructure as Code."
  }
}

module "output_resources" {
  source = "git::https://gitlab.com/infraprints/modules/aws/terraform-state-output"

  bucket = "infraprints-terraform-state-output"
  key    = "aws/infraprints/project/outputs.tf"

  terraform_output = [
    {
      key   = "aws_account_id"
      value = "123412341234"
    },
    {
      key   = "topics"
      value = jsonencode(local.topics)
    },
    {
      key   = "tags"
      value = jsonencode(local.tags)
    },
  ]
}

