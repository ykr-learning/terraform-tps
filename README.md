

https://learn.hashicorp.com/tutorials/terraform/install-cli
Sélectionner Linux, et ubuntu
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

tester avec:
terraform -version
Terraform v1.2.1
on linux_amd64
+ provider registry.terraform.io/kreuzwerker/docker v2.13.0

cd formation-devops/8-terraform/tp1
terraform init
sudo terraform apply
confirmer avec un: yes

tester sur le navigateur:
http://127.0.0.1:8000/

sudo terraform destroy

tp2:
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply


tp3:
terraform init
terraform validate

terraform workspace list
* default

terraform workspace new test
Created and switched to workspace "test"!

terraform plan
terraform apply

pour definir les credentials de aws dans des vars d'env, et éviter de les mettre dans les fichiers:
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=


https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter


https://www.terraform.io/language/values/variables
https://registry.terraform.io/providers/hashicorp/aws/latest/docs
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#argument-reference

aws:
https://us-east-1.console.aws.amazon.com/ec2/v2/home?region=us-east-1#Home:

https://app.terraform.io/app/getting-started


https://app.terraform.io/app/settings/organizations
orga-ykr-formation-22


https://app.terraform.io/app/settings/tokens


https://github.com/ykandrirody/terraform-training/settings/installations

https://github.com/settings/applications/new
orga-ykr-formation-22
https://app.terraform.io/

https://app.terraform.io/app/orga-ykr-formation-22/workspaces/new
lab-migration
https://app.terraform.io/app/orga-ykr-formation-22/workspaces/lab-migration/variables
Environment variable
AWS_ACCESS_KEY_ID
""
AWS_SECRET_ACCESS_KEY
""


terraform login
et utiliser le token créé auparavant


Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
╷
│ Error: Failed to query available provider packages
│ 
│ Could not retrieve the list of available versions for provider hashicorp/aws: locked
│ provider registry.terraform.io/hashicorp/aws 4.16.0 does not match configured version
│ constraint ~> 3.27; must use terraform init -upgrade to allow selection of new versions
╵
terraform init -upgrade

aws_instance.ec2-vm: Creation complete after 14s [id=i-0a093d5b5eab7c14f]

aws_instance.ec2-vm: Creation complete after 15s [id=i-0a0e93cbd40383acb]

aws_instance.ec2-vm: Creation complete after 12s [id=i-0dfee793cdb22fa1f]

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#import

Récupérer le callback url:
settings de l'orga terraform:
https://app.terraform.io/app/orga-ykr-formation-22/settings/profile
> Providers > Add a VCS provider
Set up provider:
https://app.terraform.io/app/orga-ykr-formation-22/settings/version-control/add
Récupérer:
https://app.terraform.io/auth/fe8ff6d7-fab1-4d84-b4b2-c8b809eb718d/callback

d'après la doc:
https://www.terraform.io/cloud-docs/vcs/github

Aller sur:
github.com > Settings > developper settings > OAuth Apps > new OAuth App
https://github.com/settings/applications/new
Terraform Cloud (orga-ykr-formation-22)
https://app.terraform.io
https://app.terraform.io/auth/fe8ff6d7-fab1-4d84-b4b2-xxx/callback
ne pas cocher:  Enable Device Flow 

recupérer client id:
3a869xxx

créer un client secret:
ed264cbxxx1111111111111111111111111

revenir coté terrform:
https://app.terraform.io/app/orga-ykr-formation-22/settings/version-control/add

GitHub.com


Skip de la partie ssh, pas besoin

dans github:
faire un fork de :
https://github.com/hashicorp/learn-terraform-github-actions
dans le fork
settings > secrets > actions > new secret
TF_API_TOKEN


Aller dans les github actions:
https://github.com/ykr-learning/learn-terraform-github-actions/actions
Et faire l'autorisation des workflows sur le repo: I understand my workflows, go ahead and enable them.

git checkout -b 'update-tfc-backend'


token github:



tp7:
https://docs.aws.amazon.com/fr_fr/AWSEC2/latest/UserGuide/create-key-pairs.html#having-ec2-create-your-key-pair

ssh-keygen -f ./ssh-key -m PEM


use case, les meta de la vm changent, du coup, elle est recréée:

recupere un autre ami:
https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-public-parameters-ami.html
puis, en changeant:
  name = "/aws/service/ami-amazon-linux-latest/amzn-ami-hvm-x86_64-gp2"

par:
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"

les meta de la vm changent, et donc, une nouvelle vm est créée:
Plan: 1 to add, 0 to change, 1 to destroy.


https://learn.hashicorp.com/tutorials/terraform/for-each?in=terraform/configuration-language


slice: https://www.terraform.io/language/functions/slice

https://www.terraform.io/language/meta-arguments/for_each






