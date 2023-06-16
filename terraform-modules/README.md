### Inicializar os modulos

```bash
terraform init
```

### tfstate centralizado remotamente no S3

- Detalhamento completo de todas as configurações do cluster.
- Trabalhar com tfstate de forma remota evita conflitos quando se tem mais de uma pessoa atuando no projeto.

```terraform
backend "s3" {
  bucket = "myfcbucket"
  key    = "terraform.tfstate"
  region = "us-east-1"
}
```
