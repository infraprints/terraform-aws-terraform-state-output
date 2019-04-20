variable "outputs" {
  type        = "list"
  description = ""
}

variable "bucket" {
  type = "string"
}

variable "key" {
  type = "string"
}

variable "tags" {
  type    = "map"
  default = {}
}
