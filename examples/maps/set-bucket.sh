#/bin/sh
set -e

bucket=$(terraform output bucket_name)
sed -i "s/TERRAFORM_BUCKET/${bucket}/g" usage/main.tf