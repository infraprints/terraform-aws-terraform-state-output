# AWS S3 Terraform State Output

Terraform module which creates an S3 Object containing terraform outputs.

These types of resources are supported:

* [S3 Bucket Object](https://www.terraform.io/docs/providers/aws/r/s3_bucket_object.html)
* [Template](https://www.terraform.io/docs/providers/template/d/file.html)

## Usage

```hcl
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
```

## Examples

* [Basic Example](examples/basic)
* [Arrays Example](examples/arrays)
* [Maps Example](examples/maps)

## Notes

* S3 Versioning should be enabled

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket | The name of the bucket to put the file in. | string | n/a | yes |
| key | The name of the object once it is in the bucket. Should end with the `.tf` file extension. | string | n/a | yes |
| tags | A mapping of tags to assign to the object. | map | `<map>` | no |
| terraform\_output | A set of terraform outputs to make available. | list | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| etag | The ETag generated for the object (an MD5 sum of the object content). For plaintext objects or objects encrypted with an AWS-managed key, the hash is an MD5 digest of the object data. For objects encrypted with a KMS key or objects created by either the Multipart Upload or Part Copy operation, the hash is not an MD5 digest, regardless of the method of encryption. More information on possible values can be found on Common Response Headers. |
| id | The key of the resource supplied above. |
| rendered | The final rendered template. |
| version\_id | A unique version ID value for the object, if bucket versioning is enabled. |
