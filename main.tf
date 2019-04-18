variable "outputs" {
  type = "map"

  default = {
    my_var_1 = "my_output"
    my_var_2 = "my_output"
    my_var_3 = "my_output"
  }
}

data "template_file" "outputs" {
  count = "${length(var.outputs)}"

  template = <<TEMPLATE
output "$${key}" {
  value = "$${value}"
}
TEMPLATE

  vars {
    key   = "${element(keys(var.outputs), count.index)}"
    value = "${element(values(var.outputs), count.index)}"
  }
}

output "rendered" {
  description = "The final rendered template."
  value       = "${join("\n", data.template_file.outputs.*.rendered)}"
}
