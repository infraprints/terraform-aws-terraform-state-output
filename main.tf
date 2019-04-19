data "template_file" "outputs" {
  count = "${length(var.outputs)}"

  template = <<TEMPLATE
output "$${key}" {
  value = "$${value}"
}
TEMPLATE

  vars {
    key   = "${lookup(var.outputs[count.index], "key")}"
    value = "${lookup(var.outputs[count.index], "value")}"
  }
}

locals {
  rendered = "${join("\n", data.template_file.outputs.*.rendered)}"
}



resource "aws_s3_bucket_object" "output" {
  bucket           = "${var.bucket}"
  key              = "${var.key}"
  content          = "${local.rendered}"
  content_language = "en-US"
  etag             = "${md5(local.rendered)}"

  tags = {
    ManagedBy = "Terraform"
  }
}
