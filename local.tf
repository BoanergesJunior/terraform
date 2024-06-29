resource "local_file" "exemplo" {
  filename = "exemplo.txt"
  content = var.content
}

variable "content" {
  type = string
  default = "Hello"
}

data "local_file" "content-data-source" {
  filename = "exemplo.txt"
}

output "data-souce-result" {
  value = data.local_file.content-data-source.content
}

output "id_file" {
  value = resource.local_file.exemplo.id
}

output "content" {
  value = resource.local_file.exemplo.content
}
