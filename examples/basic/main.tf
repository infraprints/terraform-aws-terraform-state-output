module "example" {
  source = "../../"
}

output "rendered" {
  value = "${module.example.rendered}"
}
