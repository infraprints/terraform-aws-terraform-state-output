locals {
  lbrace = "{"
}

data "null_data_source" "elements" {
  count = "${length(var.outputs)}"

  inputs = {
    key     = "${lookup(var.outputs[count.index], "key")}"
    value   = "${lookup(var.outputs[count.index], "value")}"
    isArray = "${substr(("${lookup(var.outputs[count.index], "value")}"), 0, 1) == "["}"
    isMap   = "${substr(("${lookup(var.outputs[count.index], "value")}"), 0, 1) == "${local.lbrace}"}"
  }
}

data "template_file" "outputs" {
  count = "${length(var.outputs)}"

  template = <<TEMPLATE
output "$${key}" {
  value = $${value}
}
TEMPLATE

  vars {
    key = "${lookup(data.null_data_source.elements.*.outputs[count.index], "key")}"

    value = "${lookup(data.null_data_source.elements.*.outputs[count.index], "isArray")
      ? lookup(data.null_data_source.elements.*.outputs[count.index], "value")
      : "\"${lookup(data.null_data_source.elements.*.outputs[count.index], "value")}\""
    }"

    # value = "${substr((local.nameservers), 0, 1) == "[" ? lookup(var.outputs[count.index], "value") : lookup(var.outputs[count.index], "value")}"
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
