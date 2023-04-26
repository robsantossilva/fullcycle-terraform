# Terraform
Automatize a infraestrutura em qualquer Cloud com o Terraform

Declare a infraestrutura como código em um arquivo Terraform usando HCL para provisionar recursos de qualquer provedor de infraestrutura.

- **IaC - Infrastructure as Code:** Infraestrutura como código para habilitar e acelerar a adoção da nuvem
- **Multi-cloud deployment:** Implante funções sem servidor com o AWS Lambda, gerencie recursos do Microsoft Azure Active Directory, provisione um balanceador de carga no Google Cloud e muito mais.
- **Manage Kubernetes:** Provisione e gerencie clusters Kubernetes na AWS, Microsoft Azure ou Google Cloud e interaja com seu cluster usando o provedor Kubernetes Terraform
- **Network Infrastructure Automation:** Automatize as principais tarefas de rede, como atualizar pools de membros do balanceador de carga ou aplicar políticas de firewall.
- **Manage Virtual Machine Images:** Crie pipelines de imagem de ouro multinuvem com HCP Packer e Terraform Cloud
- **Integrate with Existing Workflows:** Automatize as implantações de infraestrutura por meio de fluxos de trabalho de CI/CD existentes.
- **Enforce Policy as Code:** Aplique políticas antes que seus usuários criem a infraestrutura usando a política do Sentinel como código.
- **Inject Secrets into Terraform:** Automatize o uso de segredos e credenciais gerados dinamicamente.

### Conceitos importantes:

- **Idempotência**: Em matemática e ciência da computação, a idempotência é a propriedade que algumas operações têm de ***poderem ser aplicadas várias vezes sem que o valor do resultado se altere após a aplicação inicial.*** 
Imagine se uma pequena alteração seja necessário, e na atualização do manifesto todo o servidor é recriado? Esse não seria um comportamento adequado; Realizar a mesma tarefa mais de uma fez mesmo não sendo necessário.
- Operações **imperativas** vs **declarativas**: Os termos imperativo e declarativo aparecem frequentemente nas discussões sobre IaC. Ambos os termos referem-se à forma como o utilizador direciona a plataforma de automatização. Com uma ferramenta imperativa, define-se os passos necessários a executar de modo a alcançar a solução desejada. Com uma ferramenta declarativa, define o estado desejado para a solução final e a plataforma de automatização determina a forma de alcançar tal estado.

### Terraform vs Ansible
É comum confundir as funções dessas ferramentas, mas a questão é que a maior especialidade do Terraform é provisionar ambientes; e a do Ansible é gerenciar as configurações. E mesmo que haja um eventual overlap de funcionalidades você vai entender que é muito mais prático trabalhar assim.

### Gerenciamento de estado
O Terraform mantem um arquivo ([terraform.tfstate](./terraform.tfstate)) de estado/histórico das configurações aplicadas desde o inicio, e a cada nova modificação esse estado é comparado, aplicado e  atualizado.


### Installation
https://developer.hashicorp.com/terraform/downloads
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

### HCL - Hashcorp Configuration Language
É uma linguagem de configuração projetada para ser legível por humanos e máquinas para uso em automação de infraestrutura. É uma linguagem de serialização de dados projetada para ajudar os desenvolvedores a escrever e implantar recursos de nuvem em várias plataformas.

[local.tf](./local.tf)
```bash
> terraform init
# ---
# Initializing provider plugins...
# - Finding latest version of hashicorp/local...
# - Installing hashicorp/local v2.4.0...
# - Installed hashicorp/local v2.4.0 (signed by HashiCorp)
```

```bash
> terraform plan

# Terraform used the selected providers to generate the following execution plan. Resource actions are
# indicated with the following symbols:
#   + create

# Terraform will perform the following actions:

#   # local_file.example will be created
#   + resource "local_file" "example" {
#       + content              = "Fullcycle"
#       + content_base64sha256 = (known after apply)
#       + content_base64sha512 = (known after apply)
#       + content_md5          = (known after apply)
#       + content_sha1         = (known after apply)
#       + content_sha256       = (known after apply)
#       + content_sha512       = (known after apply)
#       + directory_permission = "0777"
#       + file_permission      = "0777"
#       + filename             = "example.txt"
#       + id                   = (known after apply)
#     }

# Plan: 1 to add, 0 to change, 0 to destroy.
```

```bash
> terraform apply
```
[example.txt](./example.txt)