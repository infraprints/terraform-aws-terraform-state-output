# Arrays Usage

Configuration in this directory creates a terraform output file (`outputs.tf`) in an S3 bucket. This example shows how to use arrays with the module.

## Usage

To run this example you need to execute:

```bash
terraform init
terraform plan
terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

## Notes

- The module created in S3 has an example usage in [usage/](usage/)
- The outputs are defined by `terraform_output`
