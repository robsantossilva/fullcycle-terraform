
// resource = Bloco
// local = Provider
// file = Tipo do Provider
// https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
resource "local_file" "example" {
  filename = "example.txt"
  content  = var.content
}

// Faz leitura do arquivo example.txt
data "local_file" "example-content" {
  filename = "example.txt"
}

output "data-source-result" {
  value = data.local_file.example-content.content
}

variable "content" {
  type = string
  # default = "hello world"
}

output "id-file" {
  value = resource.local_file.example.id
}

output "id-file-content" {
  value = resource.local_file.example.content
}
