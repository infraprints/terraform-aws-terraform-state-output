#/bin/sh
set -e

bucket=$(terraform output bucket_name)
sed -i "/source = /c\  source = \"s3::https://s3.amazonaws.com/${bucket}/basic\"" usage/main.tf