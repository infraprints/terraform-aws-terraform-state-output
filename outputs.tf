output "rendered" {
  description = "The final rendered template."
  value       = "${join("\n", data.template_file.outputs.*.rendered)}"
}
