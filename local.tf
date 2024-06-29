resource "local_file" "exemplo" {
  filename = "exemplo.txt"
  content = var.content
}

variable "content" {
  type = string
  default = "Hello"
}

output "id_file" {
  value = resource.local_file.exemplo.id
}

output "content" {
  value = resource.local_file.exemplo.content
}
