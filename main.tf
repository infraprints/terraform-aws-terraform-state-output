locals {
  lbrace = "{"
}

data "null_data_source" "elements" {
  count = length(var.terraform_output)

  inputs = {
    key      = var.terraform_output[count.index]["key"]
    value    = var.terraform_output[count.index]["value"]
    is_array = substr(var.terraform_output[count.index]["value"], 0, 1) == "["
  }
}

data "template_file" "outputs" {
  count = length(var.terraform_output)

  template = <<TEMPLATE
output "$${key}" {
  value = $${value}
}
TEMPLATE


  vars = {
    key = data.null_data_source.elements[count.index].outputs["key"]
    value = data.null_data_source.elements[count.index].outputs["is_array"] ? data.null_data_source.elements[count.index].outputs["value"] : "\"${data.null_data_source.elements[count.index].outputs["value"]}\""
  }
}

locals {
  rendered = join("\n", data.template_file.outputs.*.rendered)
}

resource "aws_s3_bucket_object" "output" {
  bucket = var.bucket
  key = var.key
  content = local.rendered
  content_language = "en-US"
  etag = md5(local.rendered)

  tags = var.tags
}

