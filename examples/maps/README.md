# Maps Usage

Configuration in this directory creates a terraform output file (`outputs.tf`) in an S3 bucket. This example shows how to use maps with the module.

## Not Yet Supported

Terraform 0.12 introduces support for better typing and more [reliable json syntax](https://www.hashicorp.com/blog/terraform-0-12-reliable-json-syntax).

For the time being, only arrays and primitives are supported by this module.

## Usage

To run this example you need to execute:

```bash
terraform init
terraform plan
terraform apply
```

You can also quickly test end to end the example below:

```bash
terraform init && terraform apply && ( bash set-bucket.sh && cd usage && terraform init && terraform apply )
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

## Notes

- The module created in S3 has an example usage in [usage/](usage/)
- The outputs are defined by `terraform_output`
