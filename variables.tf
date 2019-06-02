variable "terraform_output" {
  type        = list(string)
  description = "A set of terraform outputs to make available."
}

variable "bucket" {
  type        = string
  description = "The name of the bucket to put the file in."
}

variable "key" {
  type        = string
  description = "The name of the object once it is in the bucket. Should end with the `.tf` file extension."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the object."
  default     = {}
}

