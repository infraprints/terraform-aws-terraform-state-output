locals {
  lbrace = "{"
}

data "null_data_source" "elements" {
  count = "${length(var.terraform_output)}"

  inputs = {
    key      = "${lookup(var.terraform_output[count.index], "key")}"
    value    = "${lookup(var.terraform_output[count.index], "value")}"
    is_array = "${substr(("${lookup(var.terraform_output[count.index], "value")}"), 0, 1) == "["}"
  }
}

data "template_file" "outputs" {
  count = "${length(var.terraform_output)}"

  template = <<TEMPLATE
output "$${key}" {
  value = $${value}
}
TEMPLATE

  vars {
    key = "${lookup(data.null_data_source.elements.*.outputs[count.index], "key")}"

    value = "${lookup(data.null_data_source.elements.*.outputs[count.index], "is_array")
      ? lookup(data.null_data_source.elements.*.outputs[count.index], "value")
      : "\"${lookup(data.null_data_source.elements.*.outputs[count.index], "value")}\""
    }"
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

  tags = "${var.tags}"
}
